local M = {}

vim.cmd [[
  augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline
    autocmd WinEnter * set cursorline
  augroup end
]]

vim.cmd [[
  augroup dashboard_settings
    autocmd!
    autocmd FileType dashboard set showtabline=0
    autocmd BufWinLeave <buffer> set showtabline=2
    autocmd BufEnter * if &ft is "dashboard" | set laststatus=0 | else | set laststatus=2 | endif
    autocmd BufEnter * if &ft is "dashboard" | set nocursorline | endif
  augroup end
]]

vim.cmd(string.format(
  [[
    augroup colorscheme
      autocmd!
      autocmd VimEnter * colorscheme %s
    augroup end]],
  'onedark'
))


vim.cmd [[
  command! ConfigUpdate lua require('core.utils').update()
]]

return M
