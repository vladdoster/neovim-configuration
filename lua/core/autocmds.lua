local cmd = vim.cmd
cmd([[au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])
--cmd [[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]]
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- Stop new line comments.
cmd([[au InsertEnter * set norelativenumber ]])
cmd([[au InsertLeave * set relativenumber ]])
cmd([[au TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})]])
cmd([[augroup _markdown
        autocmd!
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal spell
    augroup end
    ]])
