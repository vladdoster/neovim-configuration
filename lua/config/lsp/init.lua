require("config.lsp.diagnostics").setup()
require("config.lsp.kind").setup()

local function on_attach(client, bufnr)
  require("config.lsp.formatting").setup(client, bufnr)
  require("config.lsp.keys").setup(client, bufnr)
  -- require("config.lsp.completion").setup(client, bufnr)
  require("config.lsp.highlighting").setup(client)
end

local servers = {
  ansiblels = {},
  bashls = {},
  clangd = {},
  cssls = {},
  dockerls = {},
  eslint = {},
  html = {},
  jsonls = {},
  pyright = {},
  sumneko_lua = {},
  vimls = {},
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- require("workspace").setup()
require("lua-dev").setup()

local options = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}
require("config.lsp.null-ls").setup(options)
require("config.lsp.install").setup(servers, options)
