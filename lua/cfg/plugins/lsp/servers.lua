-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
local lsp = require('lspconfig')
local U = require('cfg.plugins.lsp.utils')
---Common perf related flags for all the LSP servers
local flags = {allow_incremental_sync=true, debounce_text_changes=200}
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)
vim.diagnostic.config({virtual_text={source='always'}, float={source='always'}})
local function on_attach(client, buf)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  client.server_capabilities.semanticTokensProvider = nil
  U.mappings(buf)
end
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)
vim.diagnostic.config({virtual_text={source='always'}, float={source='always'}})
require'lspconfig'.pylsp.setup{settings={pylsp={plugins={pycodestyle={ignore={'W391'}, maxLineLength=100}}}}}
-- Lua
lsp.lua_ls.setup({
  flags=flags,
  capabilities=capabilities,
  on_attach=on_attach,
  settings={
    Lua={
      diagnostics={globals={'vim', 'hs'}},
      runtime={version='Lua 5.4', path={'?.lua', '?/init.lua', '/opt/homebrew/opt/lua/include/lua5.4/?.lua'}},
      workspace={
        library={
          vim.fn.expand'~/.luarocks/share/lua/5.4',
          '/opt/hs/',
          '/opt/homebrew/opt/lua/lib',
          '/opt/homebrew/opt/lua/include/lua5.4',
          os.getenv('VIMRUNTIME')
        },
        checkThirdParty=true
      },
      telemetry={enable=false}
    }
  }
})

local servers = {'eslint', 'gopls', 'html', 'jsonls', 'pylsp', 'terraformls', 'yamlls'}
local conf = {flags=flags, capabilities=capabilities, on_attach=on_attach}
for _, server in ipairs(servers) do
  lsp[server].setup(conf)
end

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
