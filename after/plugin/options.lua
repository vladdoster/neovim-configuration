vim.cmd [[syntax on]]

vim.o.backspace = 'indent,eol,start'
vim.o.backup = false
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 2
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.errorbells = false
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = false
vim.o.inccommand = 'split'
vim.o.incsearch = true
vim.o.mouse = 'a'
vim.o.ruler = true
vim.o.scrolloff = 15
vim.o.showcmd = true
vim.o.smartcase = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.startofline = false
vim.o.swapfile = false
vim.o.title = true
vim.o.undofile = true
vim.o.updatetime = 500
vim.o.wildmenu = true

vim.opt.formatoptions:remove 'o'
vim.opt.formatoptions:remove 't'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.laststatus = 3

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false

-- Fixate cmdheight to 2
vim.api.nvim_create_autocmd({'WinScrolled'}, {pattern='*', command='set cmdheight=2'})
-- vim: ft=lua sw=2 sts=2 et foldmarker=[,] foldmethod=marker
