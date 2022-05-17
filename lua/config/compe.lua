-- local util = require("util")

vim.o.completeopt = "menuone,noselect"

-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  snippet = {
    expand = function(args)
      -- For `luasnip` user.
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  formatting = {
    format = require("config.lsp.kind").cmp_format(),
  },
  -- documentation = {
  --   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  --   winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
  -- },
  experimental = {
    ghost_text = {
      hl_group = "LspCodeLens",
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
})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- local types = cmp.types
-- cmp.config.compare.kind = function(entry1, entry2)
--   local kind1 = entry1:get_kind()
--   kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
--   local kind2 = entry2:get_kind()
--   kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
--   if kind1 ~= kind2 then
--     if kind1 == types.lsp.CompletionItemKind.Snippet then
--       return false
--     end
--     if kind2 == types.lsp.CompletionItemKind.Snippet then
--       return true
--     end
--     local diff = kind1 - kind2
--     if diff < 0 then
--       return true
--     elseif diff > 0 then
--       return false
--     end
--   end
-- end

-- require("compe").setup({
--   enabled = true,
--   autocomplete = true,
--   debug = false,
--   min_length = 1,
--   preselect = "always", -- changed to "enable" to prevent auto select
--   throttle_time = 80,
--   source_timeout = 200,
--   incomplete_delay = 400,
--   max_abbr_width = 100,
--   max_kind_width = 100,
--   max_menu_width = 100,
--   documentation = {
--     border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
--   },

--   source = {
--     path = true,
--     buffer = true,
--     calc = true,
--     nvim_lsp = true,
--     nvim_lua = false,
--     vsnip = false,
--     luasnip = true,
--     treesitter = false,
--     emoji = true,
--     spell = true,
--   },
-- })

-- util.inoremap("<C-Space>", "compe#complete()", { expr = true })
-- util.inoremap("<C-e>", "compe#close('<C-e>')", { expr = true })

-- local function complete()
--   if vim.fn.pumvisible() == 1 then
--     return vim.fn["compe#confirm"]({ keys = "<cr>", select = true })
--   else
--     return require("nvim-autopairs").autopairs_cr()
--   end
-- end

-- util.imap("<CR>", complete, { expr = true })
-- vim.cmd([[autocmd User CompeConfirmDone silent! lua vim.lsp.buf.signature_help()]])
