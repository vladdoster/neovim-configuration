local bo = vim.bo
local cmd = vim.api.nvim_command
local g = vim.g -- global variables
local o = vim.o -- global options
local wo = vim.wo

vim.g.python3_host_prog = "/usr/local/bin/python3"
vim.g.python_host_prog = "/usr/bin/python2.7"

-- cmd('syntax on')
-- cmd "filetype plugin indent on"

o.termguicolors = true
o.background = "dark"

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- I have to set these individually as neovim doesn't update those
o.scrolloff = 8
wo.scrolloff = 8

-- Better editor UI
wo.number = true
wo.numberwidth = 6
wo.relativenumber = true
wo.signcolumn = "yes"
wo.cursorline = true

-- To fix a neovim bug affecting indent-blankline
-- Related: https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
wo.colorcolumn = "99999"

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.tabstop = 4
o.cindent = true
o.shiftwidth = 4
o.softtabstop = 4
o.autoindent = true
wo.wrap = true
bo.textwidth = 300
-- bo.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = false
o.swapfile = false
o.backupdir = "/tmp/"
o.directory = "/tmp/"
o.undodir = "/tmp/"

-- Completion menu option
o.completeopt = 'menuone,noselect,noinsert' -- completion options

o.hidden = true         -- enable background buffers
-- o.history = 100         -- remember n lines in history
o.lazyredraw = true     -- faster scrolling
-- o.synmaxcol = 240       -- max column for syntax highlight

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

-- o.completeopt = "menuone,noselect,noinsert" -- completion options
o.shortmess = "sI" -- don't show completion messagese

-- Disable builtin plugins
local disabled_builtins = {
    "man",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit",
}

for _, plugin in ipairs(disabled_builtins) do
    g["loaded_" .. plugin] = 1
end -- disable some builtin vim plugins
