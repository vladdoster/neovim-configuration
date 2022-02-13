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


vim.cmd [[ command! ConfigUpdate lua require('core.utils').update() ]]

vim.cmd[[ au InsertEnter * set norelativenumber ]]
vim.cmd[[ au InsertLeave * set relativenumber ]]
vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]
vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
vim.cmd [[ autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]

return M
