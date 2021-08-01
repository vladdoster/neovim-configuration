-- PACKER BOOTSTRAP
local present, _ = pcall(require, "packer")

if not present then
	local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

	print("Cloning packer..")
	-- remove the dir before cloning
	vim.fn.delete(packer_path, "rf")
	vim.fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		"--depth",
		"20",
		packer_path,
	})

	vim.cmd("packadd packer.nvim")
	present, _ = pcall(require, "packer")

	if present then
		print("Packer cloned successfully.")
	else
		error("Couldn't clone packer !\nPacker path: " .. packer_path)
	end
else
	return
end

-- HELPER FUNCTIONS
local function conf(name)
	return ([[require('plugins.config').%s()]]):format(name)
end

local function module(name)
	return ([[require('plugins.%s')]]):format(name)
end

local packer = require("packer")

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
	git = {
		clone_timeout = 600, -- Timeout, in seconds, for git clones
	},
})

packer.startup({
	function(use)
		use("wbthomason/packer.nvim")
		use({ "marko-cerovac/material.nvim", config = conf("colorscheme") })
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "akinsho/nvim-bufferline.lua", config = module("bufferline") })
		use({ "glepnir/galaxyline.nvim", config = module("statusline") })

		use({ "kevinhwang91/rnvimr", config = conf("rnvimr") })

		use({ "nvim-lua/plenary.nvim" })
		use({ "nvim-lua/popup.nvim" })

		use({
			"tpope/vim-surround",
			setup = [[vim.g.surround_no_mappings = 1]],
			keys = {
				{ "n", "sd" },
				{ "n", "cs" },
				{ "n", "cS" },
				{ "n", "ys" },
				{ "n", "yS" },
				{ "n", "yss" },
				{ "n", "ygs" },
				{ "x", "S" },
				{ "x", "gS" },
			},
			config = conf("surround"),
		})

		use({ "andymass/vim-matchup", config = conf("matchup") })
		use({ "sbdchd/neoformat", cmd = "Neoformat", config = conf("neoformat") })
		use({ "tpope/vim-repeat", opt = false })

		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })

		use({ "kabouzeid/nvim-lspinstall", event = "BufRead" })
		use({
			"neovim/nvim-lspconfig",
			after = "nvim-lspinstall",
			config = module("lspconfig"),
		})
		use({
			"onsails/lspkind-nvim",
			after = "nvim-lspinstall",
			event = "BufRead",
			config = conf("lspkind"),
		})
		use({ "ray-x/lsp_signature.nvim" })

		use({
			"hrsh7th/nvim-compe",
			event = "InsertEnter",
			config = module("compe"),
			wants = "LuaSnip",
			requires = {
				{
					"L3MON4D3/LuaSnip",
					wants = "friendly-snippets",
					event = "InsertCharPre",
					config = module("luasnip"),
				},
				{ "rafamadriz/friendly-snippets", event = "InsertCharPre" },
			},
		})
	end,
	config = {
		max_jobs = 16,
		git = { clone_timeout = 60, depth = 1 },
		profile = {
			enable = true,
			threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},
	},
})

packer.sync()
packer.compile()
