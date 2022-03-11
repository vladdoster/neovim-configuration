local cmp = require('cmp')
local luasnip = require('luasnip.util.types')
local check_backspace = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

cmp.setup({
  confirm_opts={behavior=cmp.ConfirmBehavior.Replace, select=false},
  documentation={border={'╭', '─', '╮', '│', '╯', '─', '╰', '│'}},
  experimental={ghost_text=false, native_menu=false},
  mapping={
    ['<C-k>']=cmp.mapping.select_prev_item(),
    ['<C-j>']=cmp.mapping.select_next_item(),
    ['<C-b>']=cmp.mapping(cmp.mapping.scroll_docs(-1), {'i', 'c'}),
    ['<C-f>']=cmp.mapping(cmp.mapping.scroll_docs(1), {'i', 'c'}),
    ['<C-Space>']=cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-y>']=cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>']=cmp.mapping({i=cmp.mapping.abort(), c=cmp.mapping.close()}),
    ['<CR>']=cmp.mapping.confirm({select=true}),
    ['<Tab>']=cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {'i', 's'}),
    ['<S-Tab>']=cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'})
  },
  sources=cmp.config.sources({
    {name='nvim_lsp', max_item_count=10},
    {name='luasnip', max_item_count=10},
    {name='path', max_item_count=10},
    {name='buffer', max_item_count=10}
  }),
  snippet={expand=function(args) require('luasnip').lsp_expand(args.body) end}
})
cmp.setup.cmdline(':', {sources=cmp.config.sources({{name='path'}}, {{name='cmdline'}})})
