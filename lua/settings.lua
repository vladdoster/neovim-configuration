local M = {}
local g, o, wo = vim.g, vim.o, vim.wo

-- GLOBAL EDITOR VARIABLES [
g.cursorhold_updatetime = 150 -- antoinemadec/FixCursorHold.nvim
g.mapleader = ' '
g.maplocalleader = ','
g.no_man_maps = 1
g.zipPlugin = false

g.loaded_2html_plugin = false
g.loaded_getscript = false
g.loaded_getscriptPlugin = false
g.loaded_gzip = false
g.loaded_logipat = false
g.loaded_netrwFileHandlers = false
g.loaded_netrwPlugin = false
g.loaded_netrwSettngs = false
g.loaded_remote_plugins = false
g.loaded_tar = false
g.loaded_tarPlugin = false
g.loaded_vimball = false
g.loaded_vimballPlugin = false
g.loaded_zip = false
g.loaded_zipPlugin = false
-- ]
-- OPTIONS [
-- o.completeopt = {'menuone', 'noselect'} -- options for insert mode completion
o.backup = true
o.backupdir = vim.fn.stdpath 'cache' .. '/nvim/backup'
o.breakindent = true
o.clipboard = 'unnamedplus' -- Enable yanking between vim sessions and system
o.cmdheight = 1 -- number of screen lines to use for the command line
o.colorcolumn = '99999' -- fix for the indentline problem
o.conceallevel = 0 -- show text normally
o.cursorline = true -- highlight the text line of the cursor
o.expandtab = true -- enable the use of space in tab
o.fileencoding = 'utf-8' -- file content encoding for the buffer
o.foldmethod = 'manual' -- create folds manually
o.hidden = true
o.history = 100 -- number of commands to remember in a history table
o.hlsearch = true -- keep matches highlighted after searching
o.ignorecase = true -- ignore case when searching
o.inccommand = 'nosplit' -- when typing a :s/foo/bar/g command, show live preview
o.incsearch = true -- show matches while typing
o.laststatus = 3
o.lazyredraw = true
o.list = true
o.magic = true -- change set of special search characters
o.modeline = true -- always parse modelines when loading files
o.mouse = 'n' -- enable mouse support
o.number = true -- show numberline
o.pumheight = 10 -- height of the pop up menu
o.ruler = 0
o.scrolloff = 10 -- number of lines to keep above and below the cursor
o.sessionoptions = 'globals,blank,buffers,curdir,folds,help,tabpages,winsize'
o.shiftwidth = 2 -- number of space inserted for indentation
o.showcmd = true
o.showmatch = true
o.showmode = false -- disable showing modes in command line
o.showtabline = 2
o.sidescrolloff = 10 -- number of columns to keep at the sides of the cursor
o.signcolumn = 'auto:2-5'
o.signcolumn = 'yes' -- always show the sign column
o.smartcase = true -- don't ignore case if user types an uppercase letter
o.smartindent = true -- do auto indenting when starting a new line
o.spell = false -- disable spelling checking and highlighting
o.spelllang = 'en' -- support us english
o.splitbelow = true -- splitting a new window below the current one
o.splitright = true -- splitting a new window at the right of the current one
o.swapfile = false -- disable use of swapfile for the buffer
o.switchbuf = 'usetab,newtab'
o.tabstop = 2 -- number of space in a tab
o.termguicolors = true -- enable 24-bit rgb color in the tui
o.timeoutlen = 300
o.title = true
o.titlestring = '%F'
o.undodir = vim.fn.stdpath 'cache' .. '/undo'
o.undofile = true
o.updatetime = 500
o.wildchar = 9 -- equivalent to 'set wildchar=<Tab>'
o.wrap = false -- disable wrapping of lines longer than the width of window
o.writebackup = false -- disable creating a backup before overwriting a file
-- ]
-- WINDOW OPTIONS [
wo.number = true
wo.numberwidth = 1
wo.relativenumber = true
-- ]
-- SHARED DATA [
o.shadafile = vim.fn.stdpath("data") .. "/shada/main.shada"
vim.cmd [[ silent! rsh ]]
-- ]
return M
-- vim:ft=lua:sw=2:sts=2:et:foldmarker=[,]:foldmethod=marker
