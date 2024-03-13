-- local lsp = require('lsp-zero').preset({
--   manage_nvim_cmp = {
--     set_extra_mappings = false,
--   },
-- })
-- local lsp_zero = require('lsp-zero')
--
-- lsp_zero.on_attach(function(client, bufnr)
--   local opts = { buffer = bufnr, remap = false }
--   vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
--   vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
--   vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
--   vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
--   vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
--   vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
--   vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
--   vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
--   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_) vim.lsp.buf.format() end, {})
-- end)
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   ensure_installed = { 'lua_ls', 'pylsp' },
--   handlers = {
--     lsp_zero.default_setup,
--     lua_ls = function()
--       local lua_opts = lsp_zero.nvim_lua_ls()
--       require('lspconfig').lua_ls.setup(lua_opts)
--     end,
--   },
-- })
--
-- local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
-- local luasnip = require('luasnip')
-- require('luasnip.loaders.from_vscode').lazy_load()
-- luasnip.config.setup({})
--
-- local border_opts = {
-- }
--
-- local function has_words_before()
--   local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
-- end
--
-- cmp.setup({
--   completion = { completeopt = 'menu,menuone,noinsert' },
--   confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
--   duplicates = { buffer = 1, luasnip = 1, nvim_lsp = 1, path = 1 },
--   formatting = lsp_zero.cmp_format(),
--   mapping = cmp.mapping.preset.insert({
--     ['<C-Space>'] = cmp.mapping.complete({}),
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_locally_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.locally_jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   }),
--   sources = cmp.config.sources({
--     -- { name = 'buffer', keyword_length = 3, priority = 500 },
--     -- { name = 'luasnip', keyword_length = 2, priority = 750 },
--     { name = 'nvim_lsp', keyword_length = 1, priority = 1000 },
--     -- { name = 'path', priority = 250 },
--   }),
--   window = {
--     -- completion = cmp.config.window.bordered(border_opts),
--     -- documentation = cmp.config.window.bordered(border_opts),
--   },
-- })
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls' },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer', keyword_length = 3 },
  },
  window = {
    completion = cmp.config.window.bordered({ border = 'rounded' }),
    documentation = cmp.config.window.bordered({ border = 'rounded' }),
  },
  completion = { completeopt = 'menu,menuone,noinsert' },
  confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({

    ['<C-Space>'] = cmp.mapping.complete({}),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    -- ['<C-Space>'] = cmp.mapping.complete(),
  }),
})

-- mapping = {
--   ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--   ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--   ['<C-e>'] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
--   ['<C-j>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
--   ['<C-k>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
--   ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
--   ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
--   ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--   ['<C-y>'] = cmp.config.disable,
--   ['<CR>'] = cmp.mapping.confirm { select = false },
--   ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
--   ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
--   ['<Tab>'] = cmp.mapping(function(fallback)
--     if cmp.visible() then
--       cmp.select_next_item()
--     elseif luasnip.expand_or_locally_jumpable() then
--       luasnip.expand_or_jump()
--     elseif has_words_before() then
--       cmp.complete()
--     else
--       fallback()
--     end
--   end, { 'i', 's' }),
--   ['<S-Tab>'] = cmp.mapping(function(fallback)
--     if cmp.visible() then
--       cmp.select_prev_item()
--     elseif luasnip.jumpable(-1) then
--       luasnip.jump(-1)
--     else
--       fallback()
--     end
--   end, { 'i', 's' }),
-- },
