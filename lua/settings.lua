local M = {}
-- GLOBAL EDITOR VARIABLES [
local g = vim.g
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
g.zipPlugin = false
g.did_load_filetypes = 0
g.do_filetype_lua = 1
g.python3_host_prog = '/usr/local/bin/python3'
-- ]
-- OPTIONS [
local set = vim.opt
set.backup = false -- disable making a backup file
set.clipboard = 'unnamedplus' -- connection to the system clipboard
set.cmdheight = 1 -- number of screen lines to use for the command line
set.colorcolumn = '99999' -- fix for the indentline problem
set.completeopt = {'menuone', 'noselect'} -- options for insert mode completion
set.conceallevel = 0 -- show text normally
set.cursorline = true -- highlight the text line of the cursor
set.expandtab = true -- enable the use of space in tab
set.fileencoding = 'utf-8' -- file content encoding for the buffer
set.foldmethod = 'manual' -- create folds manually
set.hidden = true -- ignore unsaved buffers
set.history = 100 -- number of commands to remember in a history table
set.hlsearch = true -- highlight all the matches of search pattern
set.ignorecase = true -- case insensitive searching
set.mouse = 'a' -- enable mouse support
set.number = true -- show numberline
set.pumheight = 10 -- height of the pop up menu
set.relativenumber = true -- show relative numberline
set.scrolloff = 8 -- number of lines to keep above and below the cursor
set.shiftwidth = 2 -- number of space inserted for indentation
set.showmode = false -- disable showing modes in command line
set.sidescrolloff = 8 -- number of columns to keep at the sides of the cursor
set.signcolumn = 'yes' -- always show the sign column
set.smartcase = true -- case sensitivie searching
set.smartindent = true -- do auto indenting when starting a new line
set.spell = false -- disable spelling checking and highlighting
set.spelllang = 'en' -- support us english
set.splitbelow = true -- splitting a new window below the current one
set.splitright = true -- splitting a new window at the right of the current one
set.swapfile = false -- disable use of swapfile for the buffer
set.tabstop = 2 -- number of space in a tab
set.termguicolors = true -- enable 24-bit rgb color in the tui
set.timeoutlen = 300 -- length of time to wait for a mapped sequence
set.undofile = true -- enable persistent undo
set.updatetime = 300 -- length of time to wait before triggering the plugin
set.wrap = false -- disable wrapping of lines longer than the width of window
set.writebackup = false -- disable creating a backup before overwriting a file
-- ]
return M
-- vim:ft=lua:sw=4:sts=4:et:foldmarker=[,]:foldmethod=marker
