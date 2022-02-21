local M = {}

M.functions = {}

local g = vim.g
local set = vim.opt

function M.bootstrap()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    }
    print 'Cloning packer...\nSetup NeoVim Configuration'
    vim.cmd [[packadd packer.nvim]]
  end
end

-- disable some builtin vim plugins
function M.disabled_builtins()
  local disabled_built_ins = {
    '2html_plugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logipat',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'matchit',
    'tar',
    'tarPlugin',
    'rrhelper',
    'spellfile_plugin',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin',
  }

  for _, plugin in pairs(disabled_built_ins) do g['loaded_' .. plugin] = 1 end
end

function M.impatient()
  local impatient_ok, _ = pcall(require, 'impatient')
  if impatient_ok then require('impatient').enable_profile() end
end

function M.compiled()
  local compiled_ok, _ = pcall(require, 'packer_compiled')
  if compiled_ok then require 'packer_compiled' end
end

function M.list_registered_providers_names(filetype)
  local s = require 'null-ls.sources'
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

function M.list_registered_formatters(filetype)
  local null_ls_methods = require 'null-ls.methods'
  local formatter_method = null_ls_methods.internal['FORMATTING']
  local registered_providers = M.list_registered_providers_names(filetype)
  return registered_providers[formatter_method] or {}
end

function M.list_registered_linters(filetype)
  local null_ls_methods = require 'null-ls.methods'
  local formatter_method = null_ls_methods.internal['DIAGNOSTICS']
  local registered_providers = M.list_registered_providers_names(filetype)
  return registered_providers[formatter_method] or {}
end

function M.update()
  local Job = require('plenary.job')
  local errors = {}

  Job:new(
    {
      command = 'git',
      args = {'pull', '--ff-only'},
      cwd = vim.fn.stdpath('config'),
      on_start = function() print('Updating...') end,
      on_exit = function()
        if vim.tbl_isempty(errors) then
          print('Updated!')
        else
          table.insert(errors, 1, 'Something went wrong! Please pull changes manually.')
          table.insert(errors, 2, '')
          print('Update failed!', {timeout = 30000})
        end
      end,
      on_stderr = function(_, err) table.insert(errors, err) end,
    }
  ):sync()
end

-- selene: allow(global_usage)
_G.dump = function(...) print(vim.inspect(...)) end

-- selene: allow(global_usage)
_G.profile = function(cmd, times)
  times = times or 100
  local args = {}
  if type(cmd) == 'string' then
    args = {cmd}
    cmd = vim.cmd
  end
  local start = vim.loop.hrtime()
  for _ = 1, times, 1 do
    local ok = pcall(cmd, unpack(args))
    if not ok then
      error(
        'Command failed: ' .. tostring(ok) .. ' ' .. vim.inspect({
          cmd = cmd,
          args = args,
        })
      )
    end
  end
  print(((vim.loop.hrtime() - start) / 1000000 / times) .. 'ms')
end

function M.execute(id)
  local func = M.functions[id]
  if not func then error('Function doest not exist: ' .. id) end
  return func()
end

local map = function(mode, key, cmd, opts, defaults)
  opts = vim.tbl_deep_extend('force', {silent = true}, defaults or {}, opts or {})

  if type(cmd) == 'function' then
    table.insert(M.functions, cmd)
    if opts.expr then
      cmd = ([[luaeval('require("core.utils").execute(%d)')]]):format(#M.functions)
    else
      cmd = ('<cmd>lua require("core.utils").execute(%d)<cr>'):format(#M.functions)
    end
  end
  if opts.buffer ~= nil then
    local buffer = opts.buffer
    opts.buffer = nil
    return vim.api.nvim_buf_set_keymap(buffer, mode, key, cmd, opts)
  else
    return vim.api.nvim_set_keymap(mode, key, cmd, opts)
  end
end

function M.map(mode, key, cmd, opt, defaults) return map(mode, key, cmd, opt, defaults) end

function M.nmap(key, cmd, opts) return map('n', key, cmd, opts) end
function M.vmap(key, cmd, opts) return map('v', key, cmd, opts) end
function M.xmap(key, cmd, opts) return map('x', key, cmd, opts) end
function M.imap(key, cmd, opts) return map('i', key, cmd, opts) end
function M.omap(key, cmd, opts) return map('o', key, cmd, opts) end
function M.smap(key, cmd, opts) return map('s', key, cmd, opts) end

function M.nnoremap(key, cmd, opts) return map('n', key, cmd, opts, {
  noremap = true,
}) end
function M.vnoremap(key, cmd, opts) return map('v', key, cmd, opts, {
  noremap = true,
}) end
function M.xnoremap(key, cmd, opts) return map('x', key, cmd, opts, {
  noremap = true,
}) end
function M.inoremap(key, cmd, opts) return map('i', key, cmd, opts, {
  noremap = true,
}) end
function M.onoremap(key, cmd, opts) return map('o', key, cmd, opts, {
  noremap = true,
}) end
function M.snoremap(key, cmd, opts) return map('s', key, cmd, opts, {
  noremap = true,
}) end

function M.t(str) return vim.api.nvim_replace_termcodes(str, true, true, true) end

function M.log(msg, hl, name)
  name = name or 'Neovim'
  hl = hl or 'Todo'
  vim.api.nvim_echo({{name .. ': ', hl}, {msg}}, true, {})
end

function M.warn(msg, name) vim.notify(msg, vim.log.levels.WARN, {title = name}) end

function M.error(msg, name) vim.notify(msg, vim.log.levels.ERROR, {title = name}) end

function M.info(msg, name) vim.notify(msg, vim.log.levels.INFO, {title = name}) end

function M.toggle(option, silent)
  local info = vim.api.nvim_get_option_info(option)
  local scopes = {buf = 'bo', win = 'wo', global = 'o'}
  local scope = scopes[info.scope]
  local options = vim[scope]
  options[option] = not options[option]
  if silent ~= true then
    if options[option] then
      M.info('enabled vim.' .. scope .. '.' .. option, 'Toggle')
    else
      M.warn('disabled vim.' .. scope .. '.' .. option, 'Toggle')
    end
  end
end

function M.float_terminal(cmd)
  local buf = vim.api.nvim_create_buf(false, true)
  local vpad = 4
  local hpad = 10
  local win = vim.api.nvim_open_win(
    buf, true, {
      relative = 'editor',
      width = vim.o.columns - hpad * 2,
      height = vim.o.lines - vpad * 2,
      row = vpad,
      col = hpad,
      style = 'minimal',
      border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
    }
  )
  vim.fn.termopen(cmd)
  local autocmd = {
    'autocmd! TermClose <buffer> lua',
    string.format('vim.api.nvim_win_close(%d, {force = true});', win),
    string.format('vim.api.nvim_buf_delete(%d, {force = true});', buf),
  }
  vim.cmd(table.concat(autocmd, ' '))
  vim.cmd([[startinsert]])
end

function M.docs()
  local name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  local docgen = require('babelfish')
  vim.fn.mkdir('./doc', 'p')
  local metadata = {
    input_file = './README.md',
    output_file = 'doc/' .. name .. '.txt',
    project_name = name,
  }
  docgen.generate_readme(metadata)
end

function M.lsp_config()
  local ret = {}
  for _, client in pairs(vim.lsp.get_active_clients()) do
    ret[client.name] = {
      root_dir = client.config.root_dir,
      settings = client.config.settings,
    }
  end
  dump(ret)
end

function M.colors(filter)
  local defs = {}
  for hl_name, hl in pairs(vim.api.nvim__get_hl_defs(0)) do
    if hl_name:find(filter) then
      local def = {}
      if hl.link then def.link = hl.link end
      for key, def_key in pairs(
        {foreground = 'fg', background = 'bg', special = 'sp'}
      ) do
        if type(hl[key]) == 'number' then
          local hex = string.format('#%06x', hl[key])
          def[def_key] = hex
        end
      end
      for _, style in pairs(
        {'bold', 'italic', 'underline', 'undercurl', 'reverse'}
      ) do if hl[style] then def.style = (def.style and (def.style .. ',') or '') .. style end end
      defs[hl_name] = def
    end
  end
  dump(defs)
end

return M
