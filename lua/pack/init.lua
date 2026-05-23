-- Plugin orchestrator built on Neovim 0.12's `vim.pack`.
--
-- Replaces `lazy.nvim`. Each plugin lives in `lua/config/plugins/<name>.lua`
-- and returns a normalized table of the form:
--
--   {
--     spec         = { src = 'https://...', name = ?, version = ? },
--     dependencies = { <bare specs>, ... },         -- optional
--     priority     = <int>,                         -- optional (eager only)
--     lazy         = { event=..., cmd=..., ft=..., keys=... }, -- optional
--     setup        = function() ... end,            -- replaces config/opts/init
--     build        = function(ev) ... end,          -- optional, runs from PackChanged
--   }
--
-- Plugins without a `lazy` table load eagerly during startup, ordered by
-- descending `priority` (matches lazy.nvim semantics).

local lockfile = require('pack.lockfile')
local loader = require('pack.loader')
local build = require('pack.build')

-- 1. Require Neovim 0.12+ (vim.pack is built-in there).
if not vim.pack or not vim.pack.add then
  error('pack: requires Neovim >= 0.12 (vim.pack is unavailable)')
end

-- 2. Ordered list of plugin modules. Order matters for eager plugins:
--    higher priority loads first; ties fall back to this list order.
local plugin_modules = {
  'config.plugins.tokyonight', -- priority 1000 (colorscheme first)
  'config.plugins.remember', -- priority 2000 (session restore very early)
  'config.plugins.autopairs',
  'config.plugins.blink-cmp', -- lazy: VimEnter
  'config.plugins.conform', -- lazy: cmd + keys
  'config.plugins.dial', -- lazy: keys
  'config.plugins.gitsigns',
  'config.plugins.guess-indent',
  'config.plugins.indent_line',
  'config.plugins.lspconfig',
  'config.plugins.mini',
  'config.plugins.neo-tree',
  'config.plugins.startuptime', -- lazy: cmd
  'config.plugins.telescope', -- lazy: VimEnter
  'config.plugins.treesitter',
  'config.plugins.trim',
}

-- 3. Collect every plugin's spec, flattening `dependencies` so they come
--    before their parent on the rtp (mirrors lazy.nvim's behaviour).
local entries = {} -- list of { spec, lazy?, setup?, priority?, build? }
local seen = {} -- spec.src -> true, dedup deps shared across plugins

local function add_spec(spec)
  if not spec or not spec.src then return end
  if seen[spec.src] then return end
  seen[spec.src] = true
  table.insert(entries, { spec = spec })
end

for _, modname in ipairs(plugin_modules) do
  local ok, mod = pcall(require, modname)
  if not ok then
    vim.notify(string.format('pack: failed to load %s: %s', modname, mod), vim.log.levels.ERROR)
  else
    if mod.dependencies then
      for _, dep in ipairs(mod.dependencies) do
        add_spec(dep)
      end
    end
    if mod.spec then
      if seen[mod.spec.src] then
        -- Already added as someone else's dependency; just attach setup/lazy.
        for _, e in ipairs(entries) do
          if e.spec.src == mod.spec.src then
            e.setup = mod.setup or e.setup
            e.lazy = mod.lazy or e.lazy
            e.priority = mod.priority or e.priority
            e.build = mod.build or e.build
            break
          end
        end
      else
        seen[mod.spec.src] = true
        table.insert(entries, {
          spec = mod.spec,
          setup = mod.setup,
          lazy = mod.lazy,
          priority = mod.priority,
          build = mod.build,
        })
      end
    end
  end
end

-- 4. Register PackChanged builders BEFORE the first vim.pack.add so install
--    builds (fzf-native make, LuaSnip make install_jsregexp, ...) fire.
build.setup()
for _, e in ipairs(entries) do
  if e.build then build.register(e.spec.name or e.spec.src, e.build) end
end

-- Build the flat list of specs for vim.pack.add.
local function specs_of(filter)
  local out = {}
  for _, e in ipairs(entries) do
    if filter(e) then table.insert(out, e.spec) end
  end
  return out
end

-- 5. Split into eager vs lazy and call vim.pack.add.
--    vim.pack natively reads `nvim-pack-lock.json` on its first call and
--    pins each plugin to the recorded revision, so we don't need to inject
--    `spec.version` ourselves.
local eager_specs = specs_of(function(e) return e.lazy == nil end)
local lazy_entries = {}
for _, e in ipairs(entries) do
  if e.lazy ~= nil then table.insert(lazy_entries, e) end
end

vim.pack.add(eager_specs, { confirm = false })
for _, e in ipairs(lazy_entries) do
  -- Use `load = function() end` so vim.pack installs the plugin (and tracks
  -- it for updates/deletion) but does NOT add it to rtp. Without this, the
  -- plugin's `plugin/*.lua` files would be sourced during Neovim's normal
  -- startup-time plugin loading, defeating lazy-loading.
  vim.pack.add({ e.spec }, { load = function() end, confirm = false })
end

-- 6. Run eager setups in descending priority order. Items without an explicit
--    priority sort after everything else but retain their relative order.
local eager_run = {}
for _, e in ipairs(entries) do
  if e.lazy == nil and e.setup then table.insert(eager_run, e) end
end
table.sort(eager_run, function(a, b) return (a.priority or 0) > (b.priority or 0) end)
for _, e in ipairs(eager_run) do
  local ok, err = pcall(e.setup)
  if not ok then
    vim.notify(
      string.format('pack: setup(%s) failed: %s', e.spec.name or e.spec.src, err),
      vim.log.levels.ERROR
    )
  end
end

-- 7. Wire lazy triggers. Each plugin's `lazy` table can contain any
--    combination of event/cmd/ft/keys; we register every trigger and the
--    loader guards against double-loading.
for _, e in ipairs(lazy_entries) do
  local name = e.spec.name or e.spec.src:match('([^/]+)%.git$') or e.spec.src:match('([^/]+)$')
  local l = e.lazy
  if l.event then loader.on_event(name, e.setup, type(l.event) == 'table' and l.event or { l.event }) end
  if l.cmd then loader.on_cmd(name, e.setup, type(l.cmd) == 'table' and l.cmd or { l.cmd }) end
  if l.ft then loader.on_ft(name, e.setup, type(l.ft) == 'table' and l.ft or { l.ft }) end
  if l.keys then loader.on_keys(name, e.setup, l.keys) end
end

-- 8. User commands.
vim.api.nvim_create_user_command(
  'PackUpdate',
  function() vim.pack.update(nil, { force = false }) end,
  { desc = 'Update all packages via vim.pack' }
)

vim.api.nvim_create_user_command('PackClean', function()
  local wanted = {}
  for _, e in ipairs(entries) do
    wanted[e.spec.name or e.spec.src] = true
  end
  local stale = {}
  for _, item in ipairs(vim.pack.get()) do
    local name = item.spec and item.spec.name
    if name and not wanted[name] then table.insert(stale, name) end
  end
  if #stale == 0 then
    vim.notify('PackClean: nothing to remove')
    return
  end
  vim.pack.del(stale)
  vim.notify('PackClean: removed ' .. table.concat(stale, ', '))
end, { desc = 'Remove plugins not listed in the orchestrator' })

vim.api.nvim_create_user_command('PackStatus', function()
  local lines = {}
  for _, item in ipairs(vim.pack.get()) do
    table.insert(
      lines,
      string.format('%s\t%s\t%s', item.spec.name or '?', item.active and 'active' or 'inactive', item.path or '')
    )
  end
  table.sort(lines)
  vim.notify(table.concat(lines, '\n'))
end, { desc = 'Print installed plugin status' })

vim.api.nvim_create_user_command('PackLockWrite', function() lockfile.write() end, {
  desc = 'Capture current plugin revisions to nvim-pack-lock.json',
})

vim.api.nvim_create_user_command('PackLockRestore', function() lockfile.restore() end, {
  desc = 'Restore plugin revisions from nvim-pack-lock.json',
})

vim.api.nvim_create_user_command('PackSync', function()
  vim.pack.update(nil, { force = true })
  vim.cmd('PackClean')
  lockfile.write()
end, { desc = 'Update -> clean -> write lockfile' })

-- vim: ts=2 sts=2 sw=2 et
