local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup{
  snippet={
    expand=function(args)
      require'luasnip'.lsp_expand(args.body) -- Luasnip expand
    end
  },
  mapping={
    ['<C-Space>']=cmp.mapping(cmp.mapping.complete(), {'i'}),
    ['<CR>']=cmp.config.disable,
    ['<C-y>']=cmp.mapping.confirm({select=true}),
    ['<C-e>']=cmp.mapping({i=cmp.mapping.abort(), c=cmp.mapping.close()}),
    ['<C-p>']=cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'}),
    ['<C-n>']=cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'})
  },

  sources=cmp.config.sources({
    {name='nvim_lsp'}, -- LSP
    {name='nvim_lsp_signature_help'}, -- LSP for parameters in functions
    {name='nvim_lua'}, -- Lua Neovim API
    {name='luasnip'}, -- Luasnip
    {name='buffer'}, -- Buffers
    {name='path'} -- Paths
  }, {}),
  formatting={
    format=lspkind.cmp_format({
      mode='label', -- Show only symbol annotations
      maxwidth=50 -- Prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    })
  }
}

-- Add snippets from Friendly Snippets
require("luasnip/loaders/from_vscode").lazy_load()

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
