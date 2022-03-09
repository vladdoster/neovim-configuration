vim.g.did_load_filetypes = 0 -- Disable vim-based filetype plugin
vim.g.do_filetype_lua = 1 -- Enable lua-based filetype plugin
vim.filetype.add({
	extension = { zsh = "sh" },
	pattern = { [".*%.env.*"] = "sh", [".*ignore"] = "conf" },
})

local g = vim.g
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
local options = {
	background = "dark",
	backup = false,
	cindent = true,
	clipboard = "unnamedplus",
	cursorline = true,
	expandtab = true,
	history = 50,
	ignorecase = true,
	number = true,
	numberwidth = 6,
	autoindent = true,
	backupdir = "/tmp/",
	directory = "/tmp/",
	formatoptions = "qrn1",
	smarttab = true,
	undodir = "/tmp/",
	relativenumber = true,
	scrolloff = 8,
	shiftwidth = 0,
	signcolumn = "yes",
	smartcase = true,
	softtabstop = -1,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 4,
	termguicolors = true,
	textwidth = 300,
	timeoutlen = 500,
	undofile = true,
	updatetime = 200,
	wrap = true,
	writebackup = false,
}
-- vim.opt.shortmess:append("c")
for k, v in pairs(options) do
	vim.opt[k] = v
end
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
