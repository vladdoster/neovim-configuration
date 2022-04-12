local M = {}
local notify_ok, notify = pcall(require, 'notify')
if not notify_ok then return end
notify.setup {
  background_colour='Normal',
  icons={DEBUG='debug:', ERROR='err:', INFO='info:', TRACE='trace:', WARN='warn:'},
  max_height=nil,
  max_width=nil,
  minimum_width=50,
  on_close=nil,
  on_open=nil,
  render='default',
  stages='fade',
  timeout=5000
}
vim.notify = notify
return M
