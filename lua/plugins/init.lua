local present, packer = pcall(require, "plugins.packer-init")
if not present then
    return false
end

local use = packer.use

return packer.startup {
    function()
        use {'wbthomason/packer.nvim' } -- pkg manager
        use {'lewis6991/impatient.nvim' } -- plugin caching
        use {'dstein64/vim-startuptime', cmd = 'StartupTime' } -- load time per plugin
        use {'marko-cerovac/material.nvim', config = [[require 'plugins.others'.material()]] }
        use {'kyazdani42/nvim-web-devicons' } -- shapes
        use {'famiu/feline.nvim', config = [[require 'plugins.feline']] } -- statusbar
        use {'akinsho/nvim-bufferline.lua', config = [[require 'plugins.bufferline']] }
        use {'machakann/vim-sandwich' }
        use {'tpope/vim-repeat' }
        use {'junegunn/vim-easy-align'}
        use {'andymass/vim-matchup', config = [[require 'plugins.matchup']] }
        -- use {'sbdchd/neoformat', cmd = 'Neoformat', opt = true }
        use { 'lukas-reineke/format.nvim', config = [[require 'plugins.others'.format()]] }
        use {'lewis6991/gitsigns.nvim', config = [[require 'plugins.gitsigns']] }
        use {'s1n7ax/nvim-terminal', config = [[require 'nvim-terminal'.setup()]] } -- persistent terminal
        use {'winston0410/commented.nvim', config = [[require 'commented'.setup()]] } -- commenting
        use {'kyazdani42/nvim-tree.lua', config = [[require 'plugins.nvimtree']] }
        use {
            "nvim-treesitter/nvim-treesitter", -- syntax highlighting
            config = [[require "plugins.treesitter"]],
            event = "BufRead",
            requires = {
                { "nvim-treesitter/nvim-treesitter-refactor", opt = true },
                { "nvim-treesitter/nvim-treesitter-textobjects", opt = true },
            },
            run = ":TSUpdate"
        }
        use {
            "nvim-telescope/telescope.nvim", -- fuzzy finder
            cmd = "Telescope",
            config = [[require "plugins.telescope"]],
            module = "telescope",
            requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
            setup = [[require "core.mappings".telescope()]],
        }
        use {
            "neovim/nvim-lspconfig", -- language server configuration
            requires = { "williamboman/nvim-lsp-installer" }, -- language server installer
            config = [[require "plugins.lsp-config"]],
        }
        use {
          "hrsh7th/nvim-cmp",
          requires = {
            { "L3MON4D3/LuaSnip", config = [[require 'plugins.others'.luasnip()]] },
            { "Saecki/crates.nvim" },
            { "f3fora/cmp-spell" },
            { "hrsh7th/cmp-buffer"},
            { "hrsh7th/cmp-nvim-lsp"},
            { "hrsh7th/cmp-nvim-lua"},
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-vsnip" },
            { "onsails/lspkind-nvim" },
            { "rafamadriz/friendly-snippets", event = "InsertEnter"},
            { "ray-x/cmp-treesitter" },
            { "saadparwaiz1/cmp_luasnip" },
          },
          config = [[require "plugins.cmp"]]
        }
        -- use {
            -- "ms-jpq/coq_nvim", -- auto-completion
            -- after = "nvim-lspconfig",
            -- branch = "coq",
            -- config = [[require "plugins.coq"]],
            -- requires = {
                -- { "ms-jpq/coq.artifacts", branch = "artifacts" }, -- snippets
                -- { "ms-jpq/coq.thirdparty", branch = "3p" }, -- misc. addons
            -- },
            -- run = ":COQdeps",
        -- }
        -- use { "rafamadriz/friendly-snippets", event = "InsertEnter"}
        -- use { "onsails/lspkind-nvim", after="friendly-snippets" }
        -- use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require "plugins.cmp"]] }
        -- use { "L3MON4D3/LuaSnip", wants = "friendly-snippets", after = "nvim-cmp", config = [[require 'plugins.others'.luasnip()]] }
        -- use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip", }
        -- use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip"}
        -- use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" }
        -- use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" }
        -- use { "hrsh7th/cmp-path", after = "cmp-buffer" }

        -- LSP
        -- use { "windwp/nvim-autopairs", after = "nvim-cmp", config = [[require("plugins.others").autopairs()]]
    end,
    config = {
        profile = { enable = true, threshold = 1 },
    },
}
