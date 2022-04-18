local tokyonight_ok, _ = pcall(require, 'tokyonight')
if not tokyonight_ok then return end

vim.g.tokyonight_style = 'night'
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = {'qf', 'terminal', 'packer'}
vim.g.tokyonight_colors = {hint='orange', error='#ff0000'}
vim.api.nvim_command(('colorscheme %s'):format('tokyonight'))
