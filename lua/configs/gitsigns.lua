local M = {}
function M.config()
  local status_ok, gitsigns = pcall(require, 'gitsigns')
  if not status_ok then return end
  gitsigns.setup{
    signs = {
      add = {hl = 'GitGutterAdd', text = '+'},
      change = {hl = 'GitGutterChange', text = '~'},
      delete = {hl = 'GitGutterDelete', text = '_'},
      topdelete = {hl = 'GitGutterDelete', text = '‾'},
      changedelete = {hl = 'GitGutterChange', text = '~'}
    },
    signcolumn = true,
    numhl = false,
    linehl = false,
    update_debounce = 200
  }
end
return M
