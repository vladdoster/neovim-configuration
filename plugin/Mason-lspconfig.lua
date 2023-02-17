local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
local ok_1, neodev = pcall(require, 'neodev')
local ok_2, lspconfig = pcall(require, 'lspconfig')
if not ok or not ok_1 or not ok_2 then return end

neodev.setup({})
mason_lspconfig.setup {}
mason_lspconfig.setup_handlers {
  function(server_name) lspconfig[server_name].setup {} end,
  ['jsonls']=function() lspconfig.jsonls.setup {settings={json={schemas=require('schemastore').json.schemas()}}} end,
  ['sumneko_lua']=function()
    require('lspconfig').sumneko_lua.setup({
      settings={
        Lua={
          completion={callSnippet='Replace'},
          runtime={version='LuaJIT'},
          diagnostics={globals={'vim'}},
          workspace={library=vim.api.nvim_get_runtime_file('', true)},
          telemetry={enable=false}
        }
      }
    })
  end,
  ['yamlls']=function()
    lspconfig.yamlls.setup {
      settings={yaml={hover=true, completion=true, validate=true, schemas=require('schemastore').json.schemas()}}
    }
  end
}
