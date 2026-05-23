local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then return false end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match('%s') == nil
end

return {
  spec = { src = 'https://github.com/saghen/blink.cmp', name = 'blink.cmp', version = vim.version.range('1.*') },
  dependencies = {
    { src = 'https://github.com/L3MON4D3/LuaSnip', name = 'LuaSnip', version = vim.version.range('2.*') },
    { src = 'https://github.com/folke/lazydev.nvim', name = 'lazydev.nvim' },
  },
  lazy = { event = { 'VimEnter' } },
  setup = function()
    require('luasnip').setup({})
    require('lazydev').setup({
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    })
    require('blink.cmp').setup({
      keymap = {
        preset = 'none',
        ['<Tab>'] = {
          function(cmp)
            if has_words_before() then return cmp.insert_next() end
          end,
          'fallback',
        },
        ['<S-Tab>'] = { 'insert_prev' },
      },
      appearance = { nerd_font_variant = 'mono' },
      completion = {
        menu = { enabled = false },
        list = { selection = { preselect = false }, cycle = { from_top = false } },
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { 'lsp', 'path', 'buffer', 'lazydev' },
        providers = { lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 } },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua', sorts = { 'exact', 'score', 'sort_text' } },
      signature = { enabled = true },
    })
  end,
}
-- vim: ts=2 sts=2 sw=2 et
