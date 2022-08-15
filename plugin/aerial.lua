local ok, aerial = pcall(require, 'aerial')
if not ok then return end
aerial.setup {
  backends={'treesitter', 'lsp', 'markdown'},
  layout={width=40, default_direction='right', placement='right'}
}
vim.keymap.set('n', '<space>s', '<cmd>AerialToggle<CR>')