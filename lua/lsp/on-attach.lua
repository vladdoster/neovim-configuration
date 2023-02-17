local ok, telescope = pcall(require, 'telescope.builtin')
if not ok then return end

return function(client, bufnr)
  local nmap = function(keys, func) vim.keymap.set('n', keys, func, {buffer=bufnr}) end
  nmap('<C-k>', vim.lsp.buf.signature_help)
  nmap('<leader>ca', vim.lsp.buf.code_action)
  nmap('<leader>ds', telescope.lsp_document_symbols)
  nmap('<leader>gd', vim.lsp.buf.definition)
  nmap('<leader>gi', vim.lsp.buf.implementation)
  nmap('<leader>gr', require('telescope.builtin').lsp_references)
  nmap('<leader>rn', vim.lsp.buf.rename)
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
  nmap('K', vim.lsp.buf.hover)
  -- :Format command local to LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, {desc='Format current buffer with LSP'})
end
