local cmp = require('cmp')

cmp.setup({
  behavior=cmp.SelectBehavior.Insert,
  completion={keyword_length=1},
  confirm_opts={behavior=cmp.ConfirmBehavior.Replace, select=true},
  window={documentation=false},
  duplicates={nvim_lsp=1, luasnip=1, buffer=1, path=1},
  experimental={ghost_text=false},
  view={entries='native'},
  snippet={expand=function(args) require('luasnip').lsp_expand(args.body) end},
  mapping={
    ['<C-p>']=cmp.mapping(cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Insert}), {'i', 'c'}),
    ['<C-d>']=cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>']=cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ['<C-Space>']=cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-e>']=cmp.mapping(cmp.mapping.confirm({behavior=cmp.ConfirmBehavior.Replace, select=true}), {'i', 'c'}),
    ['<CR>']=cmp.mapping.confirm({behavior=cmp.ConfirmBehavior.Replace, select=false}),
    ['<Tab>']=cmp.mapping(cmp.mapping.select_next_item({behavior=cmp.SelectBehavior.Insert}), {'i', 'c'}),
    ['<S-Tab>']=cmp.mapping(cmp.mapping.select_prev_item({behavior=cmp.SelectBehavior.Insert}), {'i', 'c'})
  },
  sources=cmp.config.sources({
    {name='nvim_lsp', max_item_count=10},
    {name='buffer', max_item_count=10},
    {name='luasnip', max_item_count=10},
    {name='path', max_item_count=10}
  })
})
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources=cmp.config.sources({
    {name='cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
  }, {{name='buffer'}})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {mapping=cmp.mapping.preset.cmdline(), sources={{name='buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping=cmp.mapping.preset.cmdline(),
  sources=cmp.config.sources({{name='path'}}, {{name='cmdline'}})
})
