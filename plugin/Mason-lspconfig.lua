local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
local ok_1, neodev = pcall(require, 'neodev')
local ok_2, lspconfig = pcall(require, 'lspconfig')
if not ok or not ok_1 or not ok_2 then return end

require('mason-lspconfig').setup {}
require('mason-lspconfig').setup_handlers {
  function(server_name) lspconfig[server_name].setup {} end,
  ['jsonls']=function() lspconfig.jsonls.setup {settings={json={schemas=require('schemastore').json.schemas()}}} end,
  ['sumneko_lua']=function() lspconfig.sumneko_lua.setup({settings={Lua={completion={callSnippet='Replace'}}}}) end,
  ['yamlls']=function()
    lspconfig.yamlls.setup {
      settings={yaml={hover=true, completion=true, validate=true, schemas=require('schemastore').json.schemas()}}
    }
  end
}
