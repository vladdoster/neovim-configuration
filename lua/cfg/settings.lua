local g, o = vim.g, vim.o
vim.cmd('syntax on')
vim.api.nvim_command('filetype plugin indent on')
g.mapleader = ' '
g.maplocalleader = ' '
o.background = 'dark'
o.backup = false
o.cindent = true
o.clipboard = 'unnamedplus'
o.cursorline = true
o.expandtab = true
o.history = 50
o.ignorecase = true
o.jumpoptions = 'view'
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.scrolloff = 8
o.shiftwidth = 0
o.signcolumn = 'yes:2'
o.smartcase = true
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.splitbelow = true
o.splitkeep = 'screen'
o.splitright = true
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.textwidth = 300
o.timeoutlen = 500
o.undofile = true
o.updatetime = 200
o.wrap = true
o.writebackup = false
vim.opt.diffopt:append('linematch:60')
