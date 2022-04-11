local M = {}
local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end
local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then
  return
end
local snip_status_ok, luasnip = pcall(require, 'luasnip')
if not snip_status_ok then
  return
end
cmp.setup {
  completion = { keyword_length = 1 },
  confirm_opts = { behavior = cmp.ConfirmBehavior.Replace, select = false },
  documentation = { border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' } },
  duplicates = { nvim_lsp = 1, luasnip = 1, cmp_tabnine = 1, buffer = 1, path = 1 },
  experimental = { ghost_text = true, native_menu = false },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = lspkind.cmp_format {
      menu = { buffer = '[Buffer]', nvim_lsp = '[LSP]', luasnip = '[LuaSnip]', nvim_lua = '[Lua]', latex_symbols = '[Latex]' },
      mode = 'symbol_text',
    },
  },
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = { { name = 'nvim_lsp' }, { name = 'luasnip' }, { name = 'buffer' }, { name = 'path' } },
  mapping = {
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping { c = cmp.mapping.close(), i = cmp.mapping.abort() },
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.config.disable,
    ['<CR>'] = cmp.mapping.confirm { select = true },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
}
return M
