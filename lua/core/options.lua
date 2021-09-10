local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables

local o = vim.o -- global options
local b = vim.bo -- buffer-scoped options
local w = vim.wo -- windows-scoped options

-- CACHE_PATH = vim.fn.stdpath "cache"
vim.g.python3_host_prog = "/usr/local/bin/python3"
vim.g.python_host_prog = "/usr/bin/python2.7"

-- general
g.mapleader = " " -- change leader to a comma
o.background = "dark"
o.clipboard = "unnamedplus" -- copy/paste to system clipboard
o.mouse = "a" -- enable mous support

-- o.undodir = CACHE_PATH .. "/undo"
-- o.undofile = true
-- neovim ui
o.ignorecase = true -- ignore case letters when search
o.showmatch = true -- highlight matching parenthesis
o.smartcase = true -- ignore lowercase for the whole pattern
o.splitbelow = true -- orizontal split to the bottom
o.splitright = true -- vertical split to the right
o.syntax = "enable" -- enable yntax highlighting
o.termguicolors = true
o.wrap = false

w.colorcolumn = "80" -- line lenght marker at 80 columns
w.number = true -- show line number

-- memory, cpu
b.synmaxcol = 240 -- max column for syntax highlight
o.hidden = true -- enable background buffers
o.history = 100 -- remember n lines in history
o.lazyredraw = true -- faster scrolling

-- tabs, indent
b.expandtab = true -- use spaces instead of tabs
b.shiftwidth = 4 -- shift 4 spaces when tab
b.smartindent = true -- autoindent new lines
b.tabstop = 4 -- 1 tab == 4 spaces

o.completeopt = "menuone,noselect,noinsert" -- completion options
o.shortmess = "sI" -- don't show completion messagese

-- disable some builtin vim plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
