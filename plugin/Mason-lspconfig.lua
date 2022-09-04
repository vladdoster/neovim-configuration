local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
local ok_1, lspconfig = pcall(require, 'lspconfig')
if not ok or not ok_1 then return end

require('mason-lspconfig').setup {}
require('mason-lspconfig').setup_handlers {
  function(server_name) lspconfig[server_name].setup {} end,
  ['jsonls']=function() lspconfig.jsonls.setup {settings={json={schemas=require('schemastore').json.schemas()}}} end,
  ['sumneko_lua']=function()
    lspconfig.sumneko_lua.setup(require('lua-dev').setup {
      settings={
        Lua={
          format={enable=false},
          hint={
            enable=true,
            arrayIndex='Disable', -- "Enable", "Auto", "Disable"
            await=true,
            paramName='Disable', -- "All", "Literal", "Disable"
            paramType=false,
            semicolon='Disable', -- "All", "SameLine", "Disable"
            setType=true
          },
          diagnostics={globals={'P'}}
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
