local ok, onedarkpro = pcall(require, 'onedarkpro')
if not ok then
  vim.cmd.colorscheme {'industry'}
  return
else
  onedarkpro.setup {}
  onedarkpro.load()
  vim.cmd.colorscheme {'onedarkpro'}
end
