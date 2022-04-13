vim.g.did_load_filetypes = 0 -- Disable vim-based filetype plugin
vim.g.do_filetype_lua = 1 -- Enable lua-based filetype plugin
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

    autocmd TextYankPost * lua vim.highlight.on_yank {}
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
