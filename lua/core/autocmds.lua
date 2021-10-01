local cmd = vim.cmd

cmd [[autocmd FocusGained * checktime ]]
-- cmd [[au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}]]

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

cmd[[au BufWritePre * :%s/\s\+$//e]]

vim.api.nvim_exec(
    [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]],
    false
)

-- Use relative & absolute line numbers in 'n' & 'i' modes respectively
cmd [[ au InsertEnter * set norelativenumber ]]
cmd [[ au InsertLeave * set relativenumber ]]

-- Open a file from its last left off position
cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]
