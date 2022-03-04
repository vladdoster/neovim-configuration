local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end
local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then return end
local tree_cb = nvim_tree_config.nvim_tree_callback
local g = vim.g
g.nvim_tree_indent_markers = 1
g.nvim_tree_show_icons = {git = 0, folders = 0, files = 0}
g.nvim_tree_icons = {
  default = '',
  symlink = 's',
  git = {
    unstaged = '~',
    staged = '+',
    unmerged = '!',
    renamed = '≈',
    untracked = '?',
    deleted = '-'
  }
}
nvim_tree.setup({
  diagnostics = {enable = false},
  filters = {custom = {'.git', 'node_modules'}},
  git = {ignore = false},
  update_focused_file = {enable = true},
  view = {width = 30, side = 'left'}
})
require('core.keymap').n('<C-n>', '<CMD>NvimTreeToggle<CR>')
