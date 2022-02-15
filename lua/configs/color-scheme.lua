-- Set the theme style
vim.g.material_style = 'deep ocean'

require('material').setup({
    contrast = {sidebars = true, cursor_line = true},
    italics = {comments = true, functions = true},
    contrast_filetypes = {"terminal", "packer", "qf"},
    disable = {borders = true, eob_lines = true},
    lualine_style = 'stealth'
})

-- Enable the colorscheme
vim.cmd 'colorscheme material'

