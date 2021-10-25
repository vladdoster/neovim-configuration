local exec = vim.api.nvim_exec
vim.cmd [[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]]
exec([[au BufEnter * set fo-=c fo-=r fo-=o]], false) -- don't auto comment new lines
exec([[au BufWinEnter * checktime]], false) -- faster checking
exec([[au BufWritePre * :%s/\s\+$//e]], false) -- trim whitespace on save
exec([[au InsertEnter * set norelativenumber ]], false) -- don't use relative number in insert
exec([[au InsertLeave * set relativenumber ]], false) -- use relativenumber in normal & visual
exec([[au TextYankPost * silent! lua vim.highlight.on_yank()]], false) -- highlight yanked selection
exec([[au VimResized * tabdo wincmd =]], false) -- keep windows equally resized
