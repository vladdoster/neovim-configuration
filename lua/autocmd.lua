-- -- Set local highlight overrides on non-current windows
-- autocmd({ 'WinNew', 'WinLeave' }, { command = [[setlocal winhl=CursorLine:CursorLineNC,CursorLineNr:CursorLineNrNC]] })
-- autocmd('WinEnter', { command = [[setlocal winhl=]] })
--
-- autocmd('TextYankPost', {
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })
--
-- ---- kyazdani42/nvim-tree.lua
-- autocmd('BufEnter', {
--   nested = true,
--   callback = function()
--     if
--       #vim.api.nvim_tabpage_list_wins(0) == 1
--       and vim.fn.bufname() == 'NvimTree_' .. vim.api.nvim_get_current_tabpage()
--     then
--       vim.api.nvim_win_close(0, false)
--     end
--   end,
-- })
--
-- ---- wbthomason/packer.nvim
-- autocmd('BufWritePost', {
--   pattern = vim.fn.stdpath 'config' .. '/lua/user/plugins.lua',
--   callback = function()
--     vim.schedule(require('user.fn').packer_compile)
--   end,
-- })
--
-- autocmd('User', {
--   pattern = 'PackerCompileDone',
--   callback = function()
--     vim.notify 'Packer configuration recompiled'
--   end,
-- })
vim.cmd [[
  augroup _global_settings
    autocmd!

    autocmd BufEnter * set fo-=c fo-=r fo-=o
    autocmd BufWinEnter * :set formatoptions-=cro

    autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>
    autocmd FileType man nnoremap <buffer><silent> q :quit<CR>

    autocmd FileType qf set nobuflisted
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>

    autocmd FocusGained * :checktime

    autocmd InsertEnter * set norelativenumber
    autocmd InsertEnter,WinLeave * set nocursorline

    autocmd InsertLeave * set relativenumber
    autocmd InsertLeave,WinEnter * set cursorline
  augroup end

  augroup _git_and_md_settings
    autocmd!
    autocmd FileType gitcommit,markdown setlocal wrap
    autocmd FileType gitcommit,markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end
]]
