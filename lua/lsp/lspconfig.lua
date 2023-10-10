-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------
local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status_ok then
  return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_status_ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('lsp_document_highlight', {clear=true})
    vim.api.nvim_clear_autocmds{buffer=bufnr, group='lsp_document_highlight'}
    vim.api.nvim_create_autocmd('CursorHold', {
      callback=vim.lsp.buf.document_highlight,
      buffer=bufnr,
      group='lsp_document_highlight',
      desc='Document Highlight'
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      callback=vim.lsp.buf.clear_references,
      buffer=bufnr,
      group='lsp_document_highlight',
      desc='Clear All the References'
    })
  end

  local bufopts = {noremap=true, silent=true, buffer=bufnr}
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format{async=true}
  end, bufopts)
end

vim.diagnostic.config({
  update_in_insert=true,
  float={focusable=false, style='minimal', border='rounded', source='always', header='', prefix=''}
})

vim.cmd([[
  autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
]])

local opts = {noremap=true, silent=true}
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local root_dir = function()
  return vim.fn.getcwd()
end

local servers = {bashls={}, lua_ls={Lua={workspace={checkThirdParty=true}, telemetry={enable=false}}}, pyright={}}

mason_lspconfig.setup{ensure_installed=vim.tbl_keys(servers)}
mason_lspconfig.setup_handlers{
  function(server_name)
    lspconfig[server_name].setup{
      capabilities=capabilities,
      filetypes=(servers[server_name] or {}).filetypes,
      on_attach=on_attach,
      root_dir=root_dir,
      settings=servers[server_name]
    }
  end
}
-- Call setup
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     root_dir = root_dir,
--     capabilities = capabilities,
--     flags = {
--       -- default in neovim 0.7+
--       debounce_text_changes = 150,
--     }
--   }
-- end
