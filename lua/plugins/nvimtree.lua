local present, tree_c = pcall(require, 'nvim-tree.config')
if not present then return end

vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_show_icons = {git=1, folders=1, files=0, folder_arrows=1}
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_window_picker_exclude = {filetype={'packer', 'qf', 'Trouble'}}
vim.g.nvim_tree_icons = {
    default='',
    git={unstaged='✗', staged='✓', unmerged='', renamed='➜', untracked='★'},
    folder={default='', open=''}
}

require('nvim-tree').setup {
    disable_netrw=true,
    hijack_netrw=true,
    open_on_setup=true,
    open_on_tab=true,
    auto_close=true,
    hijack_cursor=true,
    update_cwd=true,
    nvim_tree_ignore={'.git', 'node_modules', 'dist'},
    update_focused_file={enable=true, update_cwd=true, ignore_list={'fzf'}},
    ignore_ft_on_setup={},
    system_open={cmd=nil, args={}},
    view={
        width=35,
        side='left',
        auto_resize=true,
        mappings={
            custom_only=false,
            list={
                {mode='n', key='<C-t>', cb='<cmd>lua require\'telescope.builtin\'.live_grep()<cr>'}
            }
        }
    }
}

