local plugins = {}
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end
require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "lewis6991/impatient.nvim" })
	use({ "nathom/filetype.nvim" })
	use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-lua/popup.nvim" })
	use({ "marko-cerovac/material.nvim", config = [[require 'plugins.color-scheme']] })
	use({ "junegunn/vim-easy-align" })
	use({ "tpope/vim-repeat" })
	use({ "sQVe/sort.nvim", config = [[require 'sort'.setup()]] })
	use({ "kyazdani42/nvim-tree.lua", config = [[require 'plugins.nvim-tree']] })
	use({ "rafcamlet/tabline-framework.nvim", config = [[require 'plugins.tabline']] })
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
		wants = "nvim-treesitter",
		module = "nvim-gps",
		config = [[require("nvim-gps").setup({separator = " "})]],
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		config = [[require 'plugins.treesitter'.config()]],
		event = "BufRead",
		run = ":silent TSUpdate bash c go javascript lua python toml",
		requires = {
			{ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" },
			{ "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				module = "ts_context_commentstring",
				after = "nvim-treesitter",
			},
		},
	})
	use({ "williamboman/nvim-lsp-installer" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope.nvim", cmd = "Telescope", config = [[require 'plugins.telescope'.config()]] })
	use({ "akinsho/nvim-toggleterm.lua", cmd = "ToggleTerm", config = [[require 'plugins.toggleterm'.config()]] })
	use({ "lukas-reineke/indent-blankline.nvim", config = [[require 'plugins.indent-line'.config()]] })
	use({ "rcarriga/nvim-notify", config = [[require 'plugins.notify']] })
	use({ "nvim-lualine/lualine.nvim", config = [[require("plugins.lualine").setup()]] })
	use({
		"neovim/nvim-lspconfig",
		event = "BufRead",
		after = "nvim-treesitter",
		requires = { { "hrsh7th/cmp-nvim-lsp" } },
	})
	-- use({ "jose-elias-alvarez/null-ls.nvim", event = "BufRead", config = [[require('plugins.lsp.null-ls')]] })
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = [[require('plugins.lsp.cmp')]],
		requires = {
			{
				"L3MON4D3/LuaSnip",
				event = "CursorHold",
				config = [[require('plugins.lsp.luasnip')]],
				requires = { "rafamadriz/friendly-snippets" },
			},
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		},
	})
	use({
		"numToStr/Comment.nvim",
		config = [[require("Comment").setup()]],
	})
	if packer_bootstrap then
		require("packer").sync()
	end
end)
return plugins
