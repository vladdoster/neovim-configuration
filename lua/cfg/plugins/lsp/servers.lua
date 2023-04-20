-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require('neodev').setup({
  -- add any options here, or leave empty to use the default settings
})
local lsp = require('lspconfig')
local U = require('cfg.plugins.lsp.utils')
---Common perf related flags for all the LSP servers
local flags = {allow_incremental_sync=true, debounce_text_changes=200}
---Common capabilities including lsp snippets and autocompletion
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
---Common `on_attach` function for LSP servers
---@param client table
---@param buf integer
local function on_attach(client, buf)
  ---Disable formatting for servers (Handled by null-ls)
  ---@see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  ---Disable |lsp-semantic_tokens| (conflicting with TS highlights)
  client.server_capabilities.semanticTokensProvider = nil
  U.mappings(buf)
end
-- No LSP logging
vim.lsp.set_log_level(vim.lsp.log_levels.OFF)
-- Native diagnostics
vim.diagnostic.config({virtual_text={source='always'}, float={source='always'}})
-- Lua
lsp.lua_ls.setup({
  flags=flags,
  capabilities=capabilities,
  on_attach=on_attach,
  settings={
    Lua={
      runtime={version='Lua 5.3', path={'?.lua', '?/init.lua'}},
      -- runtime={version='LuaJIT'},
      completion={enable=true, showWord='Disable'},
      diagnostics={globals={'vim'}},
      telemetry={enable=false},
      workspace={checkThirdParty=true, library={os.getenv('VIMRUNTIME')}}
    }
  }
})

local servers = {'eslint', 'gopls', 'html', 'jsonls', 'pylsp', 'terraformls', 'yamlls'}
local conf = {flags=flags, capabilities=capabilities, on_attach=on_attach}
for _, server in ipairs(servers) do
  lsp[server].setup(conf)
end

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
