local cmd = vim.cmd
vim.cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]
vim.cmd[[au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql]]
vim.cmd[[au BufWinEnter * checktime]]
vim.cmd[[au BufWritePre * :%s/\s\+$//e]]
vim.cmd[[au InsertEnter * set norelativenumber]]
vim.cmd[[au InsertLeave * set relativenumber]]
vim.cmd[[au TextYankPost * silent! lua vim.highlight.on_yank()]]
vim.cmd[[au VimResized * tabdo wincmd =]]
vim.cmd[[autocmd BufReadPost *
        \ if line("'\"") > 1
        \ && line("'\"") <= line("$")
        \ | execute "normal! g`\""
        \ | endif
        ]]
-- defer lsp and utilities
local M = {}
M.packer_lazy_load = function(plugin, timer)
    if plugin then
        timer = timer or 0
        vim.defer_fn(function() require('packer').loader(plugin) end, timer)
    end
end
return M
