-- native diagnostics
vim.diagnostic.config({virtual_text={source='always'}, float={source='always'}})
-- Lua
-- Use default configuration

local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then return end
local lsp, U = require('lspconfig'), require('configs.lsp.utils')
local default_servers = {'bashls', 'dockerls', 'gopls', 'jsonls', 'pylsp', 'pyright', 'terraformls', 'yamlls'}
local lsp_installer = require('nvim-lsp-installer')
local lspconfig = require('lspconfig')

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup {
  automatic_installation=true,
  ensure_installed=default_servers,
  max_concurrent_installers=10,
  pip={install_args={}},
  ui={icons={server_installed='+', server_pending='~', server_uninstalled='-'}}
}

lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
  capabilities=require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  flags={allow_incremental_sync=true, debounce_text_changes=200},
  on_attach=require'aerial'.on_attach
})

-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  if server.name ~= 'sumneko_lua' then
    lsp.sumneko_lua.setup({
      on_attach=require('aerial').on_attach,
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
  else
    lspconfig[server.name].setup {}
  end
end
