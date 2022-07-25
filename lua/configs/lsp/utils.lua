local map = vim.keymap.set

local U = {}

---LSP servers capabilities w/ nvim-cmp
function U.capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  return require('cmp_nvim_lsp').update_capabilities(capabilities)
end

---Creates LSP mappings
---@param buf number
function U.mappings(buf)
  local opts = {buffer=buf}
  -- map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  -- map('v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
  map('i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map('n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  map('n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  map('n', '[g', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map('n', ']g', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

end

return U
