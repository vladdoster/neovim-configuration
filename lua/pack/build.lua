-- PackChanged dispatcher.
--
-- vim.pack fires a `PackChanged` autocmd whenever a plugin is installed,
-- updated, or deleted. We use it to run plugin-specific build steps (like
-- compiling fzf-native or generating treesitter parsers) without users having
-- to remember to run them by hand.
--
-- A built-in dispatch table covers the plugins that need it today. Individual
-- plugin modules can also register their own builders by exporting a `build`
-- function from their module table; `pack/init.lua` collects those at startup
-- and calls `M.register(name, fn)` for each.

local M = {}

local builders = {}

--- Register a build function for `name`.
--- The function receives the PackChangedEvent's `data` table:
---   { kind = 'install'|'update'|'delete', spec = ..., path = ... }
function M.register(name, fn)
  if type(fn) ~= 'function' then return end
  builders[name] = fn
end

--- Default built-in builders for the plugins this config uses.
local function register_defaults()
  -- telescope-fzf-native.nvim: `make` to build the C sorter.
  M.register('telescope-fzf-native.nvim', function(ev)
    if vim.fn.executable('make') ~= 1 then return end
    local result = vim.system({ 'make' }, { cwd = ev.path, text = true }):wait()
    if result.code ~= 0 then
      vim.notify(
        'pack.build: telescope-fzf-native make failed:\n' .. (result.stderr or ''),
        vim.log.levels.WARN
      )
    end
  end)

  -- nvim-treesitter: ensure loaded, then run :TSUpdate.
  M.register('nvim-treesitter', function(ev)
    if not pcall(vim.cmd.packadd, 'nvim-treesitter') then return end
    vim.schedule(function() pcall(vim.cmd, 'TSUpdate') end)
    -- Silence unused arg warning.
    local _ = ev
  end)

  -- LuaSnip: build the optional jsregexp module for full regex support.
  M.register('LuaSnip', function(ev)
    if vim.fn.has('win32') == 1 or vim.fn.executable('make') ~= 1 then return end
    local result = vim.system({ 'make', 'install_jsregexp' }, { cwd = ev.path, text = true }):wait()
    if result.code ~= 0 then
      vim.notify(
        'pack.build: LuaSnip install_jsregexp failed:\n' .. (result.stderr or ''),
        vim.log.levels.WARN
      )
    end
  end)
end

--- Install the PackChanged autocmd. Must be called BEFORE the first
--- `vim.pack.add()` so initial-install builds are not missed.
function M.setup()
  register_defaults()
  vim.api.nvim_create_autocmd('PackChanged', {
    group = vim.api.nvim_create_augroup('pack.build', { clear = true }),
    callback = function(args)
      local data = args.data or {}
      if data.kind ~= 'install' and data.kind ~= 'update' then return end
      local name = data.spec and data.spec.name
      local fn = name and builders[name]
      if fn then fn(data) end
    end,
  })
end

return M
