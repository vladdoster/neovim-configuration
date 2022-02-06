local present, nvimtree = pcall(require, 'nvim-tree')
if not present then return end
-- config
local config = {
    open_on_setup = true,
    auto_close = true,
    filters = {
        dotfiles = false,
        custom = { 'node_modules', '.cache', 'build', 'var', 'vendor' },
    },
    view = {
        width = 35,
        height = 35,
    },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
}

-- setup
require('nvim-tree').setup(config)
