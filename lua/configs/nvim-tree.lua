local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

local g = vim.g

g.nvim_tree_add_trailing = 0
g.nvim_tree_git_hl = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_icons = {
  default = '',
  symlink = '->',
  git = {
    deleted = '-',
    renamed = '≈',
    staged = '+',
    unmerged = '!',
    unstaged = '~',
    untracked = '?',
  },
}
g.nvim_tree_indent_markers = 1
g.nvim_tree_root_folder_modifier = table.concat {
  ':t:gs?$?/..',
  string.rep(' ', 1000),
  '?:gs?^??',
}

nvim_tree.setup {
  actions = { open_file = { resize_window = true } },
  diagnostics = { enable = false },
  disable_netrw = true,
  disable_window_picker = 0,
  filters = { dotfiles = false, custom = {} },
  git = { enable = true, ignore = true, timeout = 500 },
  git_hl = 1,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  open_on_setup = false,
  open_on_tab = false,
  quit_on_open = 0,
  show_icons = {
    files = 0,
    folder_arrows = 1,
    folders = 1,
    git = 0,
    tree_width = 30,
  },
  system_open = { cmd = nil, args = {} },
  update_cwd = true,
  update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
  update_to_buf_dir = { enable = true, auto_open = true },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'right',
    auto_resize = true,
    number = true,
  },
}
