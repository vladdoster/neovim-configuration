local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer=bufnr})
end)

lsp.ensure_installed({'pylsp', 'lua-language-server'})

-- require'lspconfig'.pyright.setup{}
require'lspconfig'.pylsp.setup{}
-- require('lspconfig').pyright.setup({})
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
