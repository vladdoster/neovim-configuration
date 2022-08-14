local lspconfig_ok, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_ok then return end
local util, cmp_lsp = require 'lspconfig.util', require 'cmp_nvim_lsp'
---@param opts table|nil
local function create_capabilities(opts)
  local default_opts = {with_snippet_support=true}
  opts = opts or default_opts
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = opts.with_snippet_support
  if opts.with_snippet_support then
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties={'documentation', 'detail', 'additionalTextEdits'}
    }
  end
  return cmp_lsp.update_capabilities(capabilities)
end

util.on_setup = util.add_hook_after(util.on_setup, function(config)
  if config.on_attach then
    config.on_attach = util.add_hook_after(config.on_attach, require 'configs.lsp.on-attach')
  else
    config.on_attach = require 'configs.lsp.on-attach'
  end
  config.capabilities = create_capabilities()
end)

require('mason-lspconfig').setup {}
require('mason-lspconfig').setup_handlers {
  ---@param server_name string
  function(server_name) lspconfig[server_name].setup {} end,
  ['bashls']=function() lspconfig.bashls.setup {} end,
  ['jsonls']=function() lspconfig.jsonls.setup {settings={json={schemas=require('schemastore').json.schemas()}}} end,
  ['pyright']=function() lspconfig.pyright.setup {} end,
  ['sumneko_lua']=function()
    lspconfig.sumneko_lua.setup(require('lua-dev').setup {
      settings={
        Lua={
          format={enable=true},
          hint={
            enable=true,
            arrayIndex='Enable',
            await=true,
            paramName='All',
            paramType=false,
            semicolon='All',
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
