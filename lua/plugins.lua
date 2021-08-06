-- HELPER FUNCTIONS ----------------------------------------
local function conf(name)
    return ([[require('configs.config').%s()]]):format(name)
end

local function module(name)
    return ([[require('configs.%s')]]):format(name)
end

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
        -- PLUGIN MANAGER ----a-----------------------------
        use({ "wbthomason/packer.nvim" })

        use({ "kyazdani42/nvim-tree.lua", config = module("nvimtree") })
        use({ "lukas-reineke/format.nvim", config = module("format") })
        -- GENERAL
        use({ "junegunn/vim-easy-align" })
        use({ "machakann/vim-sandwich" })
        use({ "tpope/vim-commentary" })
        use({ "tpope/vim-repeat" })
        use({"akinsho/nvim-toggleterm.lua", config = module("toggleterm")})

        use({
            "nvim-telescope/telescope.nvim",
            config = module("telescope"),
            requires = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
            opt = true,
        })
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", opt = true })
        -- LSP ---------------------------------------------
        use({
            "kabouzeid/nvim-lspinstall",
            config = function()
                require("lspinstall").setup()
            end,
        })
        use({
            "neovim/nvim-lspconfig",
            config = module("lspconfig"),
            requires = {
                { "ray-x/lsp_signature.nvim" },
                { "stevearc/aerial.nvim" },
            },
        })
        use({
            "hrsh7th/nvim-compe",
            event = "InsertEnter",
            config = module("compe"),
            wants = "LuaSnip",
            requires = {
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    config = module("luasnip"),
                },
                { "rafamadriz/friendly-snippets", event = "InsertCharPre" },
            },
        })
        -- UI ----------------------------------------------
        use({
            "marko-cerovac/material.nvim",
            config = function()
                vim.g.material_style = "darker"
                require("material").set()
            end,
        })
        use({ "kyazdani42/nvim-web-devicons" })
        use({
            "akinsho/nvim-bufferline.lua",
            config = module("bufferline"),
	    wants = "material"
            -- event = "BufWinEnter",
        })
        use({
            "glepnir/galaxyline.nvim",
            config = module("statusline"),
	    wants = "material"
            -- event = "BufWinEnter",
        })
    end,
    config = {
        git = { clone_timeout = 60, depth = 1 },
        profile = {
            enable = true,
            threshold = 1,
        },
    },
})
