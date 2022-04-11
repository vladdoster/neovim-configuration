local M = {}
local present, notify = pcall(require, 'notify')
if not present then return end
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
