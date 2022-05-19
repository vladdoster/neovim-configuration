local M = {}

local cmp_ok, cmp = pcall(require, 'cmp')
if not cmp_ok then return end
local snip_ok, luasnip = pcall(require, 'luasnip')
if not snip_ok then return end
cmp.setup {
  preselect=cmp.PreselectMode.None,
  formatting={format=require'lspkind'.cmp_format({mode='symbol', maxwidth=50})},
  snippet={expand=function(args) luasnip.lsp_expand(args.body) end},
  duplicates={nvim_lsp=1, luasnip=1, buffer=1, path=1},
  confirm_opts={behavior=cmp.ConfirmBehavior.Replace, select=false},
  experimental={ghost_text=false, native_menu=false},
  completion={keyword_length=1},
  sources={{name='nvim_lsp'}, {name='buffer'}, {name='nvim_lua'}, {name='path'}, {name='luasnip'}},
  mapping={
    ['<C-Space>']=cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
    ['<C-d>']=cmp.mapping(cmp.mapping.scroll_docs(-1), {'i', 'c'}),
    ['<C-e>']=cmp.mapping {i=cmp.mapping.abort(), c=cmp.mapping.close()},
    ['<C-f>']=cmp.mapping(cmp.mapping.scroll_docs(1), {'i', 'c'}),
    ['<C-j>']=cmp.mapping.select_next_item(),
    ['<C-k>']=cmp.mapping.select_prev_item(),
    ['<C-y>']=cmp.config.disable,
    ['<CR>']=cmp.mapping.confirm {select=true},
    ['<Tab>']=cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
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
  }
}
cmp.setup.cmdline('/', {sources={{name='buffer'}}})
cmp.setup.cmdline(':', {sources=cmp.config.sources({{name='path'}}, {{name='cmdline'}})})
cmp.setup.filetype('gitcommit', {sources=cmp.config.sources({{name='cmp_git'}}, {{name='buffer'}})})
cmp.setup.filetype('zsh', {sources=cmp.config.sources({{name='cmp_zsh'}}, {{name='buffer'}})})
return M
