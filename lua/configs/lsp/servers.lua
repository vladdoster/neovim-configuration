local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then return end
local lsp = require('lspconfig')
local U = require('configs.lsp.utils')
-- ensure_installed={'pyright', 'dockerls', 'bashls', 'terraform', 'sumneko_lua', 'go'},

lsp_installer.setup {
  automatic_installation=true,
  ensure_installed={},
  max_concurrent_installers=10,
  pip={install_args={}},
  ui={icons={server_installed='+', server_pending='~', server_uninstalled='-'}}
}

local capabilities = U.capabilities()
local flags = {allow_incremental_sync=true, debounce_text_changes=200}

-- native diagnostics
vim.diagnostic.config({virtual_text={source='always'}, float={source='always'}})

-- Lua
lsp.sumneko_lua.setup({
  flags=flags,
  capabilities=capabilities,
  on_attach=function(_, buf) U.mappings(buf) end,
  settings={
    Lua={
      completion={enable=true, showWord='Disable'},
      runtime={version='LuaJIT'},
      diagnostics={globals={'vim', 'dump'}},
      workspace={library={os.getenv('VIMRUNTIME')}},
      telemetry={enable=false}
    }
  }
})

for _, server in pairs {'gopls', 'jsonls', 'yamlls', 'terraformls'} do
  lsp[server].setup({
    flags=flags,
    capabilities=capabilities,
    on_attach=function(_, buf) U.mappings(buf) end
  })
end
--
-- -- Golang
-- lsp.gopls.setup({
--   flags = flags,
--   capabilities = capabilities,
--   on_attach = function(_, buf) U.mappings(buf) end
-- })
--
-- -- Json
-- lsp.jsonls.setup({
--   flags = flags,
--   capabilities = capabilities,
--   on_attach = function(_, buf) U.mappings(buf) end
-- })
--
-- -- YAML
-- lsp.yamlls.setup({
--   flags = flags,
--   capabilities = capabilities,
--   on_attach = function(_, buf) U.mappings(buf) end
-- })
--
-- -- Terraform
-- lsp.terraformls.setup({
--   flags = flags,
--   capabilities = capabilities,
--   on_attach = function(_, buf) U.mappings(buf) end
-- })
