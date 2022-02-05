local present, cmp = pcall(require, "cmp")
if not present then return end
-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
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
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'buffer' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
  },
}

-- local default = {
    -- completion = {completeopt = "menuone,noselect"},
    -- documentation = {border = "single"},
    -- snippet = (snippets_status and {expand = function(args) require("luasnip").lsp_expand(args.body) end}) or
        -- {expand = function(_) end},
    -- mapping = {
        -- ["<C-p>"] = cmp.mapping.select_prev_item(),
        -- ["<C-n>"] = cmp.mapping.select_next_item(),
        -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-Space>"] = cmp.mapping.complete(),
        -- ["<C-e>"] = cmp.mapping.close(),
        -- ["<CR>"] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace, select = true},
        -- ["<Tab>"] = cmp.mapping(function(fallback)
            -- if cmp.visible() then
                -- cmp.select_next_item()
            -- elseif snippets_status and require("luasnip").expand_or_jumpable() then
                -- require("luasnip").expand_or_jump()
            -- else
                -- fallback()
            -- end
        -- end, {"i", "s"}),
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
            -- if cmp.visible() then
                -- cmp.select_prev_item()
            -- elseif require("luasnip").jumpable(-1) then
                -- require("luasnip").jump(-1)
            -- else
                -- fallback()
            -- end
        -- end, {"i", "s"})
    -- },
    -- sources = {{name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"}, {name = "nvim_lua"}, {name = "path"}}
-- }
--cmp.setup(default)
