local present, tree_c = pcall(require, "nvim-tree.config")
if not present then
    return
end

vim.g.nvim_tree_ignore = { ".git", "node_modules", "dist" }
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
        "packer",
        "qf",
        "Trouble",
    },
}

vim.g.nvim_tree_icons = {
    default = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
    },
    folder = {
        default = "",
        open = "",
    },
}

vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {
    noremap = true,
    silent = true,
})

vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", {
    noremap = true,
    silent = true,
})

require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    open_on_tab = true,
    lsp_diagnostics = true,
    auto_close = false,
    hijack_cursor = true,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = { "fzf" },
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = nil,
        args = {},
    },
    view = {
        width = 35,
        side = "left",
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {
                {
                    mode = "n",
                    key = "<C-t>",
                    cb = "<cmd>lua require'telescope.builtin'.live_grep()<cr>",
                },
            },
        },
    },
}

-- require("nvim-tree").setup {
--     disable_netrw = true,
--     hijack_netrw = true,
--     open_on_setup = true,
--     ignore_ft_on_setup = {},
--     auto_close = true,
--     open_on_tab = false,
--     update_to_buf_dir = true,
--     hijack_cursor = false,
--     update_cwd = true,
--     lsp_diagnostics = false,
--     update_focused_file = {
--         enable = false,
--         update_cwd = true,
--         ignore_list = {
--             ".git",
--             "node_modules",
--             ".cache",
--             "build",
--             "__pycache__",
--         },
--     },
--     system_open = {
--         cmd = nil,
--         args = {},
--     },
--     view = {
--         width = 30,
--         side = "left",
--         auto_resize = true,
--         mappings = {
--             custom_only = false,
--             list = {},
--         },
--     },
-- }
--
-- g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
-- g.nvim_tree_gitignore = 1
-- g.nvim_tree_quit_on_open = 1
-- g.nvim_tree_indent_markers = 1
-- g.nvim_tree_hide_dotfiles = 1
-- g.nvim_tree_git_hl = 1
-- g.nvim_tree_highlight_opened_files = 1
-- g.nvim_tree_root_folder_modifier = ":~"
-- g.nvim_tree_add_trailing = 1
-- g.nvim_tree_group_empty = 1
-- g.nvim_tree_disable_window_picker = 1
-- g.nvim_tree_icon_padding = " "
-- g.nvim_tree_symlink_arrow = " >> "
-- g.nvim_tree_respect_buf_cwd = 0
-- g.nvim_tree_create_in_closed_folder = 0
-- g.nvim_tree_refresh_wait = 500
