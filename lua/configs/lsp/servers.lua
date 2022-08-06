-- native diagnostics
vim.diagnostic.config({virtual_text={source='always'}, float={source='always'}})
-- Lua
-- Use default configuration

-- local lsp, U = require('lspconfig'), require('configs.lsp.utils')
-- local default_servers = {'bashls', 'dockerls', 'gopls', 'jsonls', 'pylsp', 'pyright', 'terraformls', 'yamlls'}
-- local lspconfig = require('lspconfig')

-- lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
--   capabilities=require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   flags={allow_incremental_sync=true, debounce_text_changes=200},
--   on_attach=require'aerial'.on_attach
-- })

-- 3. Loop through all of the installed servers and set it up via lspconfig
-- for _, server in ipairs(lsp_installer.get_installed_servers()) do
--   if server.name ~= 'sumneko_lua' then
--     lsp.sumneko_lua.setup({
--       on_attach=require('aerial').on_attach,
--       settings={
--         Lua={
--           completion={enable=true, showWord='Disable'},
--           runtime={version='LuaJIT'},
--           diagnostics={globals={'vim', 'dump'}},
--           workspace={library={os.getenv('VIMRUNTIME')}},
--           telemetry={enable=false}
--         }
--       }
--     })
--   else
--     lspconfig[server.name].setup {}
--   end
-- end
