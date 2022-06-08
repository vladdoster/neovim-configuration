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
local servers = {'bashls', 'dockerls', 'pylsp', 'pyright', 'sumneko_lua', 'terraformls'}
for _, lsp in ipairs(servers) do lsp_cfg[lsp].setup {options} end
require('configs.lsp.null-ls').setup(options)
