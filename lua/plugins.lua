-- HELPER FUNCTIONS
local function conf(name)
    return ([[require('configs.config').%s()]]):format(name)
end

local function module(name) return ([[require('configs.%s')]]):format(name) end

local present, _ = pcall(require, "bootstrap_packer")

if present then
    packer = require("packer")
else
    print("--- ERROR: packer failed to load")
    return false
end

local use = packer.use

packer.startup({
    function()
        use {"wbthomason/packer.nvim"}



        use {"kyazdani42/nvim-tree.lua", config = module("nvimtree")}
        use {"sbdchd/neoformat", cmd = "Neoformat",config = conf("neoformat")}

        use {"junegunn/vim-easy-align"}
        use {"machakann/vim-sandwich"}
        use {"tpope/vim-commentary"}
        use {"tpope/vim-repeat"}

        use {
            'nvim-telescope/telescope.nvim',
            config = module('telescope'),
	    requires = {{"nvim-lua/plenary.nvim"},
            		{"nvim-lua/popup.nvim"}},
	    opt=true
        }
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", opt = true}
        use {"neovim/nvim-lspconfig",
		requires= {
				{'ray-x/lsp_signature.nvim'},
				{"kabouzeid/nvim-lspinstall"},
				{'stevearc/aerial.nvim'}
			}
		,config = module("lspconfig")}
        use {
            "hrsh7th/nvim-compe",
            config = module("compe"),
            wants = "LuaSnip",
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    config = module("luasnip")
                }, {"rafamadriz/friendly-snippets", event = "InsertCharPre"}
            }
        }
        use {"kyazdani42/nvim-web-devicons", opt=false}
        use {
            "akinsho/nvim-bufferline.lua",
            config = module("bufferline"),
        }
        use {
            "glepnir/galaxyline.nvim",
            config = module("statusline"),
        }
        use {
            "marko-cerovac/material.nvim",
            config = function()
                vim.g.material_style = "darker"
                require("material").set()
            end
        }

    end,
    config = {
        git = {clone_timeout = 60, depth = 1},
        profile = {
            enable = true,
            threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
        }
    }
})
