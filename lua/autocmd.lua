vim.g.did_load_filetypes = 0 -- Disable vim-based filetype plugin
vim.g.do_filetype_lua = 1 -- Enable lua-based filetype plugin
local cmd = vim.cmd

-- vim.cmdustom filetypes
vim.filetype.add({
  extension = {eslintrc = 'json', prettierrc = 'json', conf = 'conf', mdx = 'markdown'},
  pattern = {
    ['.*%.env.*'] = 'sh',
    ['.*ignore'] = 'conf' -- ['.*tmux.*conf$'] = 'tmux',
  },
  filename = {['yup.lock'] = 'yaml'}
})

cmd([[au FocusGained * :checktime]])
cmd([[ autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif ]])
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
cmd([[au InsertEnter * set norelativenumber ]])
cmd([[au InsertLeave * set relativenumber ]])
cmd([[au TextYankPost * lua vim.highlight.on_yank {}]])
cmd([[autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>]])
cmd([[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]])
cmd([[autocmd FileType markdown setlocal spell]])
cmd([[
    autocmd InsertLeave,WinEnter * set cursorline
    autocmd InsertEnter,WinLeave * set nocursorline
]])
cmd([[
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
]])

