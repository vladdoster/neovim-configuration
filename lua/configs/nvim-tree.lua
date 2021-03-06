local nvimtree_ok, nvimtree = pcall(require, 'nvim-tree')
if not nvimtree_ok then return end
-- globals must be set prior to requiring nvim-tree to function
local g = vim.g
g.nvim_tree_add_trailing = 1 -- append a trailing slash to folder names
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = table.concat {':t:gs?$?/..', string.rep(' ', 1000), '?:gs?^??'}

g.nvim_tree_show_icons = {folders=0, files=0, git=0}

nvimtree.setup({
  filters={dotfiles=false},
  disable_netrw=true,
  hijack_netrw=true,
  ignore_ft_on_setup={'dashboard'},
  auto_close=false,
  open_on_tab=false,
  hijack_cursor=true,
  hijack_unnamed_buffer_when_opening=false,
  update_cwd=true,
  update_focused_file={enable=true, update_cwd=false},
  view={allow_resize=true, side='left', width=25, hide_root_folder=true},
  git={enable=false, ignore=false},
  actions={open_file={resize_window=true}},
  renderer={indent_markers={enable=true}}
})

return M
