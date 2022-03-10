local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_show_icons = {git = 1, folders = 0, files = 0}
g.nvim_tree_icons = {
  default = '',
  symlink = '->',
  git = {
    unstaged = '~',
    staged = '+',
    unmerged = '!',
    renamed = '≈',
    untracked = '?',
    deleted = '-'
  }
}

require('nvim-tree').setup({
  diagnostics = {enable = false},
  update_focused_file = {enable = true},
  view = {width = 35, side = 'right'},
  filters = {custom = {'.git', 'node_modules'}},
  git = {ignore = false},
  actions = {open_file = {window_picker = {enable = false}}}
})

require('keymap').n('<C-n>', ':NvimTreeToggle<CR>')

vim.api.nvim_create_augroup('NVIM_TREE', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'NVIM_TREE',
  pattern = 'NvimTree',
  callback = function() vim.api.nvim_win_set_option(0, 'wrap', false) end
})
