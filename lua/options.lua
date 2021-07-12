CONFIG_PATH = vim.fn.stdpath("config")
DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
TERMINAL = vim.fn.expand("$TERMINAL")

local cmd = vim.cmd
local opt = vim.opt
local buf_opt = vim.bo

cmd("filetype plugin indent on")

---  VIM ONLY COMMANDS  ---

cmd("filetype plugin on")
cmd('let &titleold="' .. TERMINAL .. '"')
cmd("set inccommand=split")
cmd("set iskeyword+=-")
cmd("set whichwrap+=<,>,[,],h,l")
cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")

---  SETTINGS  ---
opt.autoindent = true
opt.backup = false
opt.breakindent = true
opt.clipboard = "unnamedplus"
opt.cmdheight = 2
opt.completeopt = { "menuone", "noselect" }
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.expandtab = true -- convert tabs to spaces
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.numberwidth = 2 -- set number column width to 2 {default 4}
opt.pumheight = 10 -- pop up menu height
opt.scrolloff = 3
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.shortmess:append("c")
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 2 -- always show tabs
opt.sidescrolloff = 8
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.smartcase = true
opt.smartindent = true -- make indenting smarter again
opt.softtabstop = 4
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.tabstop = 4
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 100
opt.title = true -- set the title of window to the value of the titlestring
opt.undodir = CACHE_PATH .. "/undo" -- set an undo directory
opt.undofile = true -- enable persisten undo
opt.updatetime = 250
opt.whichwrap = "b,s,<,>,[,],h,l"
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

buf_opt.autoindent = true
buf_opt.expandtab = true
buf_opt.shiftwidth = 4
buf_opt.softtabstop = 4
buf_opt.tabstop = 4

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.signcolumn = "yes"
vim.wo.wrap = false

local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin", -- 'man',
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
}
for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end
