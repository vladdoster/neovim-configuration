local cmp, luasnip, lspkind = require('cmp'), require('luasnip.util.types'), require('lspkind')
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end
cmp.setup({
  completion={completeopt='menu,menuone,noselect', keyword_length=2},
  confirm_opts={behavior=cmp.ConfirmBehavior.Replace, select=false},
  documentation={border={'╭', '─', '╮', '│', '╯', '─', '╰', '│'}},
  experimental={ghost_text=false, native_menu=false},
  formatting={
    format=lspkind.cmp_format({
      mode='symbol_text',
      menu=({
        buffer='[Buffer]',
        nvim_lsp='[LSP]',
        luasnip='[LuaSnip]',
        nvim_lua='[Lua]',
        latex_symbols='[Latex]'
      })
    })
  },
  mapping={
    ['<C-k>']=cmp.mapping.select_prev_item(),
    ['<C-j>']=cmp.mapping.select_next_item(),
    ['<C-b>']=cmp.mapping(cmp.mapping.scroll_docs(-1), {'i', 'c'}),
    ['<C-f>']=cmp.mapping(cmp.mapping.scroll_docs(1), {'i', 'c'}),
    ['<C-Space>']=cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-y>']=cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>']=cmp.mapping({i=cmp.mapping.abort(), c=cmp.mapping.close()}),
    ['<CR>']=cmp.mapping.confirm{behavior=cmp.ConfirmBehavior.Replace, select=true},
    ['<Tab>']=cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
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

