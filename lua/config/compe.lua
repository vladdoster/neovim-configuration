-- local util = require("util")

vim.o.completeopt = 'menuone,noselect'

-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup {
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  snippet = {
    expand = function(args)
      -- For `luasnip` user.
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  formatting = {
    format = require('config.lsp.kind').cmp_format(),
  },
  -- documentation = {
  --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
  -- },
  experimental = {
    ghost_text = {
      hl_group = 'LspCodeLens',
    },
  },
  sorting = {
    comparators = {
      cmp.config.compare.sort_text,
      cmp.config.compare.offset,
      -- cmp.config.compare.exact,
      cmp.config.compare.score,
      -- cmp.config.compare.kind,
      -- cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done { map_char = { tex = '' } })
