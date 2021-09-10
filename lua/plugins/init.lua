local present_0, impatient = pcall(require, "impatient")
if present_0 then
    impatient.enable_profile()
end

local present_1, packer = pcall(require, "plugins.packerInit")
if not present_1 then
    return false
end

local use = packer.use

return packer.startup {
    function()
        use { "lewis6991/impatient.nvim" }
        use { "nvim-lua/plenary.nvim" }
        use { "wbthomason/packer.nvim", event = "VimEnter" }

        use { "kyazdani42/nvim-web-devicons", after = "packer.nvim" }
        use {
            "marko-cerovac/material.nvim",
            config = function()
                require("plugins.configs.others").material()
            end,
        }

        use {
            "famiu/feline.nvim",
            config = function()
                require("feline").setup { preset = "noicon" }
            end,
        }

        use {
            "akinsho/bufferline.nvim",
            after = "nvim-web-devicons",
            config = function()
                require "plugins.configs.bufferline"
            end,
            setup = function()
                require("core.mappings").bufferline()
            end,
        }

        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufRead",
            config = function()
                require("plugins.configs.others").blankline()
            end,
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
            requires = { "andymass/vim-matchup" },
            config = function()
                require "plugins.configs.treesitter"
            end,
        }

        use { "dstein64/vim-startuptime", cmd = "StartupTime" }
        use { "godlygeek/tabular" }
        use { "monaqa/dial.nvim" }
        use { "tpope/vim-repeat" }
        use { "tpope/vim-surround" }

        use {
            "sbdchd/neoformat",
            cmd = "Neoformat",
            setup = function()
                require("core.mappings").neoformat()
            end,
        }

        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require "plugins.configs.gitsigns"
            end,
        }

        use { "kabouzeid/nvim-lspinstall" }

        use {
            "neovim/nvim-lspconfig",
            after = "nvim-lspinstall",
            config = function()
                require "plugins.configs.lspconfig"
            end,
        }
        use {
            "ray-x/lsp_signature.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("plugins.configs.others").signature()
            end,
        }

        use {
            "jdhao/better-escape.vim",
            event = "InsertEnter",
            setup = function()
                require("plugins.configs.others").better_escape()
            end,
        }

        use { "rafamadriz/friendly-snippets", event = "InsertEnter" }

        use {
            "hrsh7th/nvim-cmp",
            after = "friendly-snippets",
            config = function()
                require "plugins.configs.cmp"
            end,
        }

        use {
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require("plugins.configs.others").autopairs()
            end,
        }

        use {
            "L3MON4D3/LuaSnip",
            after = "nvim-cmp",
            wants = "friendly-snippets",
            config = function()
                require("plugins.configs.others").luasnip()
            end,
        }

        use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" }
        use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" }
        use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }
        use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }

        use {
            "terrortylor/nvim-comment",
            cmd = "CommentToggle",
            config = function()
                require("plugins.configs.others").comment()
            end,
            setup = function()
                require("core.mappings").comment()
            end,
        }

        use {
            "kyazdani42/nvim-tree.lua",
            after = "nvim-web-devicons",
            cmd = { "NvimTreeToggle", "NvimTreeFocus" },
            config = function()
                require "plugins.configs.nvimtree"
            end,
            setup = function()
                require("core.mappings").nvimtree()
            end,
        }

        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            requires = {
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            },
            config = function()
                require "plugins.configs.telescope"
            end,
            setup = function()
                require("core.mappings").telescope()
            end,
        }
    end,
    config = {
        profile = { enable = false, threshold = 1 },
    },
}
