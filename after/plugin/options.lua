vim.cmd [[syntax on]]

local g, o = vim.g, vim.opt

g.do_filetype_lua = 1
g.did_load_filetypes = 0
g.highlighturl_enabled = true
g.mapleader = ' '
g.zipPlugin = false
g.load_black = false
g.loaded_2html_plugin = true
g.loaded_getscript = true
g.loaded_getscriptPlugin = true
g.loaded_gzip = true
g.loaded_logipat = true
g.loaded_matchit = true
g.loaded_netrwFileHandlers = true
g.loaded_netrwPlugin = true
g.loaded_netrwSettngs = true
g.loaded_remote_plugins = true
g.loaded_tar = true
g.loaded_tarPlugin = true
g.loaded_zip = true
g.loaded_zipPlugin = true
g.loaded_vimball = true
g.loaded_vimballPlugin = true

o.backspace = 'indent,eol,start'
o.backup = false
o.clipboard = 'unnamedplus'
o.cmdheight = 2
o.completeopt = 'menu,menuone,noselect'
o.copyindent = true
o.cursorline = true
o.errorbells = false
o.expandtab = true
o.fileencoding = 'utf-8'
o.formatoptions:remove 'o'
o.formatoptions:remove 't'
o.grepformat = '%f:%l:%c:%m,%f:%l:%m'
o.grepprg = 'rg --vimgrep --no-heading --smart-case'
o.hidden = true
o.history = 100
o.hlsearch = true
o.ignorecase = true
o.inccommand = 'split'
o.incsearch = true
o.laststatus = 3
o.lazyredraw = true
o.mouse = 'a'
o.number = true
o.preserveindent = true
o.pumheight = 10
o.relativenumber = true
o.ruler = true
o.scrolloff = 5
o.shiftwidth = 2
o.showcmd = true
o.showmode = false
o.sidescrolloff = 8
o.signcolumn = 'yes'
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.startofline = false
o.swapfile = false
o.tabstop = 2
o.termguicolors = true
o.timeoutlen = 300
o.title = true
o.undofile = true
o.updatetime = 300
o.wildmenu = true
o.wrap = false
o.writebackup = false

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = true

-- Fixate cmdheight to 2
vim.api.nvim_create_autocmd({'WinScrolled'}, {pattern='*', command='set cmdheight=2'})
