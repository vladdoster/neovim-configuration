-- Lazy-load primitives for vim.pack-managed plugins.
--
-- Each primitive registers a one-shot trigger that, on first activation:
--   1. packadd's the plugin (making its rtp files available),
--   2. invokes the plugin's `setup()` function from its module,
--   3. re-dispatches the original trigger (key, command, ...) when relevant.
--
-- All primitives are idempotent: triggers fire at most once per plugin.

local M = {}

--- Guard table so a plugin is only loaded once even if multiple triggers fire.
local loaded = {}

--- Load a plugin by name and run its setup function. Idempotent.
local function load_plugin(name, setup)
  if loaded[name] then return end
  loaded[name] = true
  local ok, err = pcall(vim.cmd.packadd, name)
  if not ok then
    vim.notify(string.format('pack.loader: packadd %s failed: %s', name, err), vim.log.levels.ERROR)
    return
  end
  if type(setup) == 'function' then
    local sok, serr = pcall(setup)
    if not sok then
      vim.notify(string.format('pack.loader: setup(%s) failed: %s', name, serr), vim.log.levels.ERROR)
    end
  end
end

--- Trigger plugin load on one of `events` (e.g. {'VimEnter', 'BufReadPost'}).
function M.on_event(name, setup, events)
  vim.api.nvim_create_autocmd(events, {
    once = true,
    group = vim.api.nvim_create_augroup('pack.loader.' .. name, { clear = true }),
    callback = function() load_plugin(name, setup) end,
  })
end

--- Trigger plugin load when a buffer with one of `filetypes` is opened.
function M.on_ft(name, setup, filetypes)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetypes,
    once = true,
    group = vim.api.nvim_create_augroup('pack.loader.' .. name, { clear = true }),
    callback = function() load_plugin(name, setup) end,
  })
end

--- Trigger plugin load when one of `cmds` is invoked.
--- Registers a stub user command per name; on first call it tears down the
--- stubs, loads the plugin (which redefines the real command), and re-runs
--- the command preserving bang, args, range, and modifiers.
function M.on_cmd(name, setup, cmds)
  for _, cmd in ipairs(cmds) do
    vim.api.nvim_create_user_command(cmd, function(opts)
      -- Tear down every stub so the real plugin commands can take over.
      for _, c in ipairs(cmds) do
        pcall(vim.api.nvim_del_user_command, c)
      end
      load_plugin(name, setup)
      -- Re-dispatch the original invocation using the modern :Cmd! a b c form.
      local parts = { cmd }
      if opts.bang then parts[1] = parts[1] .. '!' end
      if opts.args and opts.args ~= '' then table.insert(parts, opts.args) end
      local line = table.concat(parts, ' ')
      if opts.range and opts.range > 0 then line = opts.line1 .. ',' .. opts.line2 .. ' ' .. line end
      vim.cmd(line)
    end, {
      bang = true,
      nargs = '*',
      range = true,
      desc = 'pack.loader: lazy stub for ' .. name,
    })
  end
end

--- Trigger plugin load on first press of one of `keys_spec` items.
---
--- `keys_spec` is the same shape used by lazy.nvim:
---   { '<C-a>', mode = 'n', expr = true, function() ... end }
--- but only `keys` (string) and optional `mode` (string|table) are inspected
--- by the stub; the actual mapping is owned by the plugin's `setup()`.
function M.on_keys(name, setup, keys_spec)
  -- Install a stub mapping per (key, mode) pair. On first press it deletes
  -- every stub, loads the plugin (which installs the real mapping), then
  -- replays the key so the real mapping picks it up. Replaying through
  -- nvim_feedkeys() with mode 'm' ensures expr mappings work.
  local function stub_modes(spec_modes)
    if not spec_modes then return { 'n' } end
    if type(spec_modes) == 'string' then return { spec_modes } end
    return spec_modes
  end

  for _, spec in ipairs(keys_spec) do
    local lhs = spec[1]
    local modes = stub_modes(spec.mode)
    for _, mode in ipairs(modes) do
      vim.keymap.set(mode, lhs, function()
        -- Tear down every stub mapping for this plugin so the real one can
        -- install cleanly.
        for _, s in ipairs(keys_spec) do
          for _, m in ipairs(stub_modes(s.mode)) do
            pcall(vim.keymap.del, m, s[1])
          end
        end
        load_plugin(name, setup)
        local feed = vim.api.nvim_replace_termcodes(lhs, true, false, true)
        vim.api.nvim_feedkeys(feed, 'm', false)
      end, { desc = 'pack.loader: lazy stub for ' .. name })
    end
  end
end

return M
