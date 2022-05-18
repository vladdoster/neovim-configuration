local cmp = require 'cmp'

local wincfg = { winhighlight = 'Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSel,Search:None' }
cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noselect',
    get_trigger_characters = function(trigger_characters)
      return vim.tbl_filter(function(char)
        return char ~= ' '
      end, trigger_characters)
    end,
  },
  window = {
    completion = wincfg,
    documentation = wincfg,
  },
  view = {
    entries = { name = 'custom', selection_order = 'bottom_up' },
  },
  experimental = {
    ghost_text = true,
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require('luasnip').expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require('luasnip').jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  sources = cmp.config.sources {
    { name = 'buffer', keyword_length = 2 },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'treesitter' },
  },
  formatting = {
    format = require('config.lsp.kind').cmp_format {
      before = function(entry, vim_item)
        vim_item.menu = ({
          buffer = 'Buf',
          git = 'Git',
          luasnip = 'Snip',
          nvim_lsp = 'LSP',
          nvim_lua = 'Lua',
          path = 'Path',
          treesitter = 'TS',
        })[entry.source.name]
        return vim_item
      end,
    },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.order,
      cmp.config.compare.score,
      cmp.config.compare.sort_text,
    },
  },
}
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
