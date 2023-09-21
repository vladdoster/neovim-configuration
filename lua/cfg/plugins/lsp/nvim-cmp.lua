local cmp = require('cmp')
local icons = {
  Class='ﴯ',
  Color='',
  Constant='',
  Constructor='',
  Enum='',
  EnumMember='',
  Event='',
  Field='',
  File='',
  Folder='',
  Function='',
  Interface='',
  Keyword='',
  Method='',
  Module='',
  Operator='',
  Property='ﰠ',
  Reference='',
  Snippet='',
  Struct='פּ',
  Text='',
  TypeParameter='',
  Unit='塞',
  Value='',
  Variable=''
}
local aliases = {nvim_lsp='lsp', luasnip='snippet'}
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local luasnip = require'luasnip'
luasnip.setup{region_check_events='InsertEnter', delete_check_events='InsertEnter'}
require('luasnip.loaders.from_vscode').lazy_load()

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end
cmp.setup({
  snippet={
    expand=function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  window={completion={winhighlight='Normal:Pmenu,FloatBorder:Pmenu,Search:None', col_offset=-3, side_padding=0}},
  mapping=cmp.mapping.preset.insert({
    ['<C-Space>']=cmp.mapping.complete(),
    ['<C-d>']=cmp.mapping.scroll_docs(-4),
    ['<C-e>']=cmp.config.disable,
    ['<C-f>']=cmp.mapping.scroll_docs(4),
    ['<C-y>']=cmp.mapping.confirm({select=true})
  }),
  sources=cmp.config.sources({
    {name='nvim_lsp', max_item_count=10},
    {name='treesitter', max_item_count=10},
    {name='buffer', max_item_count=10},
    {name='luasnip', max_item_count=10},
    {name='path', max_item_count=10}
  }),
  formatting={
    format=function(entry, item)
      item.kind = string.format('%s %s', icons[item.kind], item.kind)
      item.menu = string.format('[%s]', aliases[entry.source.name] or entry.source.name)
      return item
    end
  }
})
-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
