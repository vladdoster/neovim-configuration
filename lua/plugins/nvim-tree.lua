local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end
local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
if not config_status_ok then return end
local tree_cb = nvim_tree_config.nvim_tree_callback
local g = vim.g
g.nvim_tree_indent_markers = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}
g.nvim_tree_icons = {
  default = '',
  symlink = '',
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
  view = {width = 35, side = 'left'},
  filters = {custom = {'.git', 'node_modules'}},
  git = {ignore = false}
})
require('core.keymap').n('<C-n>', '<CMD>NvimTreeToggle<CR>')
