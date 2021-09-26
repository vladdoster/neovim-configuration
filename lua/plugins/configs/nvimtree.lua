local present, tree_c = pcall(require, "nvim-tree.config")
if not present then
    return
end

local g = vim.g

g.nvim_tree_width = 30
g.nvim_tree_gitignore = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_width_allow_resize = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
g.nvim_tree_side = "left"
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}
g.nvim_tree_icons = {
    default = "‣ ",
}

require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {},
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
        enable = false,
        update_cwd = true,
        ignore_list = {
            ".git",
            "node_modules",
            ".cache",
            "build",
            "__pycache__",
        },
    },
    system_open = {
        cmd = nil,
        args = {},
    },
}
