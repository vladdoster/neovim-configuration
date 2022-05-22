local status_ok, lsp_cfg = pcall(require, 'lspconfig')
if not status_ok then return end

require 'configs.lsp.lsp-installer'
require('configs.lsp.handlers').setup()

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local options = {
  on_attach=require('configs.lsp.handlers').on_attach,
  capabilities=require('configs.lsp.handlers').capabilities,
  flags={debounce_text_changes=150}
}

-- Enable the following language servers
local servers = {'bashls', 'sumneko_lua', 'pyright', 'terraformls', 'dockerls'}
for _, lsp in ipairs(servers) do lsp_cfg[lsp].setup {options} end

require('configs.lsp.null-ls').setup(options)
