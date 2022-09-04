local ok, lspconfig = pcall(require, 'lspconfig')
local ok_1, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok or not ok_1 then return end

local util = require 'lspconfig.util'

local function create_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  vim.list_extend(capabilities.textDocument.completion.completionItem.resolveSupport.properties,
                  {'documentation', 'detail', 'additionalTextEdits'})
  return cmp_lsp.update_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
  if config.on_attach then
    config.on_attach = util.add_hook_after(config.on_attach, require 'lsp.on-attach')
  else
    config.on_attach = require 'lsp.on-attach'
  end
  config.capabilities = vim.tbl_deep_extend('force', create_capabilities(), config.capabilities or {})
end)
