local cmp = require('cmp')

cmp.setup({
  completion={keyword_length=1},
  confirm_opts={behavior=cmp.ConfirmBehavior.Replace, select=false},
  duplicates={nvim_lsp=1, luasnip=1, buffer=1, path=1},
  experimental={ghost_text=false, native_menu=false},
  formatting={[[ require'lspkind'.cmp_format({mode='symbol', maxwidth=50})} ]]},
  snippet={expand=[[ require('luasnip').lsp_expand(args.body) ]]},
  window={completion=cmp.config.window.bordered(), documentation=cmp.config.window.bordered()},
  mapping=cmp.mapping.preset.insert({
    ['<C-e>']=cmp.config.disable,
    ['<C-d>']=cmp.mapping.scroll_docs(-4),
    ['<C-f>']=cmp.mapping.scroll_docs(4),
    ['<C-y>']=cmp.mapping.confirm({select=true}),
    ['<C-Space>']=cmp.mapping.complete()
  }),
  sources=cmp.config.sources({
    {name='nvim_lsp', max_item_count=10},
    {name='buffer', max_item_count=10},
    {name='luasnip', max_item_count=10},
    {name='path', max_item_count=10}
  })
})
cmp.setup.cmdline('/', {sources={{name='buffer'}}})
cmp.setup.cmdline(':', {sources=cmp.config.sources({{name='path'}}, {{name='cmdline'}})})
cmp.setup.filetype('gitcommit', {sources=cmp.config.sources({{name='cmp_git'}}, {{name='buffer'}})})
cmp.setup.filetype('zsh', {sources=cmp.config.sources({{name='cmp_zsh'}}, {{name='buffer'}})})
