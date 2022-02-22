local lsp = require('lspconfig')
local U = require('plugins.lsp.utils')
local capabilities = U.capabilities()
local flags = {allow_incremental_sync = true, debounce_text_changes = 200}
-- native diagnostics
vim.diagnostic.config({
  virtual_text = {source = 'always'},
  float = {source = 'always'}
})
-- lua
lsp.sumneko_lua.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buf)
    U.disable_formatting(client)
    U.mappings(buf)
  end,
  settings = {
    Lua = {
      completion = {enable = true, showWord = 'Disable'},
      runtime = {version = 'LuaJIT', path = U.get_luajit_path()},
      diagnostics = {globals = {'vim', 'dump'}},
      workspace = {library = U.get_nvim_rtp_path()},
      telemetry = {enable = false}
    }
  }
})
-- golang
lsp.gopls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buf)
    U.disable_formatting(client)
    U.mappings(buf)
  end
})
-- typescript
lsp.tsserver.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buf)
    U.disable_formatting(client)
    U.mappings(buf)
  end
})
-- json
lsp.jsonls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buf)
    U.disable_formatting(client)
    U.mappings(buf)
  end
})
-- yaml
lsp.yamlls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buf)
    U.disable_formatting(client)
    U.mappings(buf)
  end
})
-- terraform
lsp.terraformls.setup({
  flags = flags,
  capabilities = capabilities,
  on_attach = function(client, buf)
    U.disable_formatting(client)
    U.mappings(buf)
  end
})
