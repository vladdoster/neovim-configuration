local present, packer = pcall(require, "plugins.packerInit")
if not present then
    return false
end

local use = packer.use

return packer.startup {
    function()
        use { "wbthomason/packer.nvim" }
        use { "lewis6991/impatient.nvim" }
        use { "dstein64/vim-startuptime", cmd = "StartupTime" }
        -- UI
        use {
            "marko-cerovac/material.nvim",
            config = [[require "plugins.others".material()]],
        }
        use { "kyazdani42/nvim-web-devicons" }
        use { "famiu/feline.nvim", config = [[require "plugins.feline"]] }
        use {
            "akinsho/nvim-bufferline.lua",
            config = [[require 'plugins.bufferline']],
        }
        use {
            "machakann/vim-sandwich",
            "tpope/vim-repeat",
            {
                "andymass/vim-matchup",
                config = [[require 'plugins.matchup']],
            },
        }
        use {
            "sbdchd/neoformat",
            cmd = "Neoformat",
            opt = true,
            -- setup = [[require "core.mappings".neoformat()]],
        }
        use { "lewis6991/gitsigns.nvim", config = [[require "plugins.gitsigns"]] }
        use { "s1n7ax/nvim-terminal", config = [[require "nvim-terminal".setup()]] }
        use{'winston0410/commented.nvim', config = [[require 'commented'.setup()]] }
        use {
            "kyazdani42/nvim-tree.lua",
            config = [[require "plugins.nvimtree"]],
        }
        -- LSP
        use {
            "neovim/nvim-lspconfig",
            requires = { "williamboman/nvim-lsp-installer" },
            config = [[require "plugins.lspconfig"]],
            -- run = ":LspInstall bashls pyright sumneko_lua gopls terraformls tflint yamlls jsonls",
        }
        use {
            "ms-jpq/coq_nvim",
            after = "nvim-lspconfig",
            branch = "coq",
            config = [[require "plugins.coq"]],
            requires = {
                { "ms-jpq/coq.artifacts", branch = "artifacts" },
                { "ms-jpq/coq.thirdparty", branch = "3p" },
            },
            run = ":COQdeps",
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            requires = {"ms-jpq/coq_nvim"},
            config = [[require "plugins.treesitter"]],
            event = "BufRead",
            requires = {
                { "nvim-treesitter/nvim-treesitter-refactor", opt = true },
                { "nvim-treesitter/nvim-treesitter-textobjects", opt = true },
            },
            run = ":TSUpdate",
        }
        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            config = [[require "plugins.telescope"]],
            module = "telescope",
            requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
            setup = [[require "core.mappings".telescope()]],
        }
    end,
    config = {
        profile = { enable = true, threshold = 1 },
    },
}
