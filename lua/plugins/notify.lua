local ok, notify = pcall(require, 'notify')
if not ok then return end
vim.notify = notify
notify.setup({
  stages = 'slide',
  timeout = 2500,
  minimum_width = 50,
  icons = {DEBUG = 'DEBUG: ', ERROR = 'ERROR: ', INFO = 'INFO: ', TRACE = 'TRACE: ', WARN = 'WARNING: '}
})
