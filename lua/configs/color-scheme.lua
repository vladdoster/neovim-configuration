local onedarkpro_ok, onedarkpro = pcall(require, 'onedarkpro')
if not onedarkpro_ok then return end
vim.o.background = 'dark'
onedarkpro.load()
