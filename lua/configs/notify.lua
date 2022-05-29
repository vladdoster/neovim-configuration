local M = {}
local notify_ok, notify = pcall(require, 'notify')
if not notify_ok then return end
notify.setup {
  icons={DEBUG='debug:', ERROR='err:', INFO='info:', TRACE='trace:', WARN='warn:'},
  max_height=nil,
  max_width=50,
  minimum_width=30,
  render='default',
  stages='fade',
  timeout=3000
}
vim.notify = notify
return M
