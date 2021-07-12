local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
	return
end

packer.init({
	compile_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled.vim"),
	git = { clone_timeout = 300 },
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")
vim.cmd("packadd packer.nvim")

local use = require("packer").use
require("packer").startup(function()
	use("wbthomason/packer.nvim")
	-- Syntax Highlighting and Visual Plugins
	use({ "akinsho/nvim-bufferline.lua", config = [[require('bufferline').setup {}]] })
	use("hoob3rt/lualine.nvim")
	use("glepnir/dashboard-nvim")
	-- Tree-Sitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use({ "lewis6991/spellsitter.nvim", config = [[require('spellsitter').setup {}]] })
	-- Colorschemes
	use("norcalli/nvim-colorizer.lua")
	use({ "tjdevries/colorbuddy.nvim", requires = { "gruvbox-community/gruvbox", "joshdick/onedark.vim" } })
	-- LSP and Autocomplete
	use({
		"neovim/nvim-lspconfig",
		requires = { "onsails/lspkind-nvim", "glepnir/lspsaga.nvim", "hrsh7th/nvim-compe", "kabouzeid/nvim-lspinstall" },
	})
	use({ "tzachar/compe-tabnine", run = "./install.sh", requires = { "hrsh7th/nvim-compe" } })
	use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = [[require('trouble').setup {}]] })
	-- Snippets
	use("hrsh7th/vim-vsnip")
	use("SirVer/ultisnips")
	use("honza/vim-snippets")
	use("norcalli/snippets.nvim")
	use("rafamadriz/friendly-snippets")
	-- Version Control
	use({ "TimUntersberger/neogit", requires = "lewis6991/gitsigns.nvim", config = [[require('neogit').setup {}]] })
	-- Navigation
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" } })
	use("kyazdani42/nvim-tree.lua")
	use("ggandor/lightspeed.nvim")
	use("phaazon/hop.nvim")
	use({ "karb94/neoscroll.nvim", config = [[require('neoscroll').setup {}]] })
	-- Terminal Integration
	use("akinsho/nvim-toggleterm.lua")
	-- Other
	use("folke/which-key.nvim")
	use("lukas-reineke/format.nvim")
	use("monaqa/dial.nvim")
	use("rmagatti/auto-session")
	use("windwp/nvim-autopairs")

	use({ "terrortylor/nvim-comment", config = [[require('nvim_comment').setup {}]] })
	-- Language Specific
	use({ "jghauser/follow-md-links.nvim", config = [[require('follow-md-links')]] })
	use("davidgranstrom/nvim-markdown-preview")
end)
