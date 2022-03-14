local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then return end

local g = vim.g

g.nvim_tree_indent_markers = 1
g.nvim_tree_icons = {
  default='',
  symlink='->',
  git={unstaged='~', staged='+', unmerged='!', renamed='≈', untracked='?', deleted='-'}
}
nvim_tree.setup{
  disable_netrw=true,
  hijack_netrw=true,
  open_on_setup=false,
  auto_close=true,
  open_on_tab=false,
  hijack_cursor=false,
  update_cwd=true,
  update_to_buf_dir={enable=true, auto_open=true},
  diagnostics={enable=false},
  update_focused_file={enable=true, update_cwd=true, ignore_list={}},
  system_open={cmd=nil, args={}},
  filters={dotfiles=false, custom={}},
  git={enable=true, ignore=true, timeout=500},
  view={width=30, height=30, hide_root_folder=false, side='right', auto_resize=true, number=true},
  quit_on_open=0,
  git_hl=1,
  disable_window_picker=0,
  root_folder_modifier=':t',
  show_icons={files=0, folder_arrows=1, folders=1, git=0, tree_width=30}
}
