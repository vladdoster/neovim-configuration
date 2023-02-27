local lsp = require('lspconfig')
local U = require('cfg.plugins.lsp.utils')
---Common perf related flags for all the LSP servers
local flags = {allow_incremental_sync=true, debounce_text_changes=200}
---Common capabilities including lsp snippets and autocompletion
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
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
      completion={enable=true, showWord='Disable'},
      runtime={version='LuaJIT'},
      diagnostics={globals={'vim'}},
      workspace={library={os.getenv('VIMRUNTIME')}},
      telemetry={enable=false}
    }
  }
})
local servers = {
  'cssls', -- CSS
  'emmet_ls', -- emmet-ls
  'gopls', -- Golang
  'html', -- HTML
  'jsonls', -- Json
  'terraformls', -- Terraform
  'yamlls', -- YAML
  'pylsp'
}
local conf = {flags=flags, capabilities=capabilities, on_attach=on_attach}
for _, server in ipairs(servers) do lsp[server].setup(conf) end
