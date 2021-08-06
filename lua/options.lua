local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local o = vim.o -- global options
local b = vim.bo -- buffer-scoped options
local w = vim.wo -- windows-scoped options

vim.g.python3_host_prog = "/usr/local/bin/python3"

-- general
b.swapfile = false -- don't use swapfile
g.mapleader = " " -- change leader to a comma
o.background = "dark"
o.clipboard = "unnamedplus" -- copy/paste to system clipboard
o.guifont = "JetBrains Mono Font:h15" -- the font used in graphical neovim applications
o.mouse = "a" -- enable mous support

-- neovim ui
o.ignorecase = true -- ignore case letters when search
o.showmatch = true -- highlight matching parenthesis
o.smartcase = true -- ignore lowercase for the whole pattern
o.splitbelow = true -- orizontal split to the bottom
o.splitright = true -- vertical split to the right
o.syntax = "enable" -- enable syntax highlighting
w.colorcolumn = "80" -- line lenght marker at 80 columns
w.foldmethod = "marker" -- enable folding (default 'foldmarker')
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
local vim = vim

-- check if file changed when its window is focus, more eager than 'autoread'
cmd([[autocmd FocusGained * checktime ]])
cmd([[* silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=400})]])
cmd(
    [[BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
-- disable auto comment new lines
cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])
-- remove line length marker for selected filetypes
cmd([[
  autocmd FileType text,markdown,xml,html,xhtml,javascript setlocal cc=0
]])
-- 2 spaces for selected filetypes
cmd([[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,go,python setlocal shiftwidth=4 tabstop=4
]])
-- autocompletion
o.completeopt = "menuone,noselect,noinsert" -- completion options
o.shortmess = "c" -- don't show completion messagese
-- Disable built-in plugins
local disabled_built_ins = {
    "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "gzip", "zip",
    "zipPlugin", "tar", "tarPlugin", "getscript", "getscriptPlugin", "vimball",
    "vimballPlugin", "2html_plugin", "logipat", "rrhelper", "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do vim.g["loaded_" .. plugin] = 1 end
