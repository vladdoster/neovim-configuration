--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then desc = 'LSP: ' .. desc end

    vim.keymap.set('n', keys, func, {buffer = bufnr, desc = desc})
  end

  nmap('<leader>rn', vim.lsp.buf.rename)
  nmap('<leader>ca', vim.lsp.buf.code_action)

  nmap('gd', require('telescope.builtin').lsp_definitions)
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('gI', require('telescope.builtin').lsp_implementations)
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols)
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols)
  nmap('<S-K>', vim.lsp.buf.hover)
  nmap('<C-k>', vim.lsp.buf.signature_help)
  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration)
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder)
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder)
  nmap('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_) vim.lsp.buf.format() end, {})
end
-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
  lua_ls = {
    Lua = {
      diagnostics = {globals = {"hs", "vim"}},
      workspace = {checkThirdParty = false},
      telemetry = {enable = false}
    }
  },
  pyright = {}
}

-- Setup neovim lua configuration
-- require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {ensure_installed = vim.tbl_keys(servers)}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes
    }
  end
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
