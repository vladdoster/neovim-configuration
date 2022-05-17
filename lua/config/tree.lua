-- vim.g.nvim_tree_ignore = { ".git", "node_modules" }
-- vim.g.nvim_tree_gitignore = 1
-- vim.g.nvim_tree_auto_open = 1
-- vim.g.nvim_tree_auto_close = 1
-- vim.g.nvim_tree_follow = 1
-- vim.g.nvim_tree_auto_ignore_ft = { "dashboard", "startify" }
-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_git_hl = 1
-- vim.g.nvim_tree_disable_netrw = 0
-- vim.g.nvim_tree_lsp_diagnostics = 1

-- following options are the default
require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
  },
  filters = {
    custom = { ".git", "node_modules", ".cargo" },
  },
})
