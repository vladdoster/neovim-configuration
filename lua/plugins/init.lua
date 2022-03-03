local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("--- installing packer close and reopen neovim...")
	vim.cmd([[packadd packer.nvim]])
end
-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end
packer.init({ display = {
	open_fn = function()
		return require("packer.util").float({ border = "rounded" })
	end,
} })
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")
	use("dstein64/vim-startuptime")
	use("junegunn/vim-easy-align")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("tpope/vim-repeat")
	use("antoinemadec/FixCursorHold.nvim")
	use({ "akinsho/nvim-toggleterm.lua", cmd = "ToggleTerm", config = [[require 'plugins.toggleterm']] })
	use({ "kyazdani42/nvim-tree.lua", config = [[require 'plugins.nvim-tree']] })
	use({ "lukas-reineke/indent-blankline.nvim", config = [[require 'plugins.indent-line']] })
	use({ "marko-cerovac/material.nvim", config = [[require 'plugins.color-scheme']] })
	use({ "numToStr/Comment.nvim", config = [[require "plugins.comment"]] })
	use({ "nvim-lualine/lualine.nvim", config = [[require "plugins.lualine"]] })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope.nvim", cmd = "Telescope", config = [[require 'plugins.telescope']] })
	use({ "rafcamlet/tabline-framework.nvim", config = [[require 'plugins.tabline']] })
	use({ "rcarriga/nvim-notify", config = [[require 'plugins.notify']] })
	use({ "sQVe/sort.nvim", config = [[require 'sort'.setup()]] })
	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
	})
	-- cmp plugins
	use({
		"hrsh7th/nvim-cmp",
		config = [[require 'plugins.cmp']],
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
		},
	})
	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = [[require 'plugins.lsp']],
		requires = {
			"williamboman/nvim-lsp-installer",
			"tamago324/nlsp-settings.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
	})
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
