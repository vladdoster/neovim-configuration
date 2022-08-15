local ok, onedarkpro = pcall(require, 'onedarkpro')
if not ok then return end
vim.o.background = 'dark'
onedarkpro.setup {}
vim.cmd [[colorscheme onedarkpro]]
