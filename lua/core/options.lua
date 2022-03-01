local g, o = vim.g, vim.o
g.loaded_2html_plugin = 1
g.loaded_fzf = 1
g.loaded_gzip = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zipPlugin = 1

vim.opt.formatoptions = vim.opt.formatoptions - "a" - "t" + "c" + "q" - "o" + "r" + "n" + "j" - "2"

vim.cmd("syntax on")

g.mapleader = " "
g.maplocalleader = " "

o.autoindent = true
o.background = "dark"
o.backup = false
o.clipboard = "unnamedplus"
o.cursorline = true
o.expandtab = true
o.history = 50
o.ignorecase = true
o.lazyredraw = true
o.number = true
o.numberwidth = 4
o.relativenumber = true
o.scrolloff = 8
o.shiftwidth = 0
o.signcolumn = "yes"
o.smartcase = true
o.softtabstop = -1
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.tabstop = 4
o.termguicolors = true
o.textwidth = 300
o.undodir = "/tmp/"
o.undofile = true
o.updatetime = 200
o.wrap = false
o.writebackup = false
