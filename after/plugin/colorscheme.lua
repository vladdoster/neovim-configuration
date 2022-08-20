local ok, onedarkpro = pcall(require, 'onedarkpro')
if not ok then
  vim.cmd [[colorscheme industry]]
  return
end
onedarkpro.load {}
vim.cmd [[colorscheme onedarkpro]]
