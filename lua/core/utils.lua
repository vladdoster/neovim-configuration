local cmd = vim.cmd
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]] -- don't auto comment new lines
cmd [[au BufEnter *.py set ai sw=4 ts=4 sta et fo=croql]] -- python
cmd [[au BufWinEnter * checktime]] -- faster checking
cmd [[au BufWritePre * :%s/\s\+$//e]] -- trim whitespace on save
cmd [[au InsertEnter * set norelativenumber]] -- don't use relative number in insert
cmd [[au InsertLeave * set relativenumber]] -- use relativenumber in normal & visual
cmd [[au TextYankPost * silent! lua vim.highlight.on_yank()]] -- highlight yanked selection
cmd [[au VimResized * tabdo wincmd =]] -- keep windows equally resized

-- defer lsp and utilities
local M = {}
M.packer_lazy_load = function(plugin, timer)
    if plugin then
        timer = timer or 0
        vim.defer_fn(function() require('packer').loader(plugin) end, timer)
    end
end
return M
