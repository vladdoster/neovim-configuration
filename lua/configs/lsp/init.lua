local status_ok, lsp_cfg = pcall(require, 'lspconfig')
if not status_ok then return end
require 'configs.lsp.lsp-installer'
require'configs.lsp.handlers'.setup {}
local options = {
  on_attach=require('configs.lsp.handlers').on_attach,
  capabilities=require('configs.lsp.handlers').capabilities,
  flags={debounce_text_changes=150}
}
-- Enable following language servers
local servers = {'bashls', 'dockerls', 'pylsp', 'pyright', 'terraformls'}
for _, lsp in ipairs(servers) do lsp_cfg[lsp].setup {options} end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lsp_cfg.sumneko_lua.setup {
  on_attach=options.on_attach,
  capabilities=options.capabilities,
  flags=options.flags,
  settings={
    Lua={
      runtime={version='LuaJIT', path=runtime_path},
      diagnostics={globals={'vim', 'hs'}},
      workspace={library=vim.api.nvim_get_runtime_file('', true)},
      telemetry={enable=false}
    }
  }
}
require('configs.lsp.null-ls').setup(options)
