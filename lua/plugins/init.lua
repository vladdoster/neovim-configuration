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
        use { "wbthomason/packer.nvim" }
        use { "kyazdani42/nvim-web-devicons" }
        use {
            "marko-cerovac/material.nvim",
            config = [[require("plugins.configs.others").material()]],
        }
        use { "famiu/feline.nvim", config = [[require "plugins.configs.feline"]] }
        use { "andymass/vim-matchup" }
        -- Highlights
        use {
            "nvim-treesitter/nvim-treesitter",
            config = [[require "plugins.configs.treesitter"]],
            requires = {
                "nvim-treesitter/nvim-treesitter-refactor",
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            run = ":TSUpdate",
        }
        use { "dstein64/vim-startuptime", cmd = "StartupTime" }
        use { "tpope/vim-repeat" }
        use { "tpope/vim-surround" }
        use {
            "sbdchd/neoformat",
            cmd = "Neoformat",
            opt = true,
            setup = [[require("core.mappings").neoformat()]],
        }
        use { "lewis6991/gitsigns.nvim", config = [[require "plugins.configs.gitsigns"]] }
        use {
            "williamboman/nvim-lsp-installer",
            run = ":LspInstall bashls pyright sumneko_lua gopls terraformls tflint yamlls jsonls",
        }
        use {
            "neovim/nvim-lspconfig",
            requires = {
                "nvim-lsp-installer",
            },
            config = [[require "plugins.configs.lspconfig"]],
        }
        use {
            "ms-jpq/coq_nvim",
            branch = "coq",
            config = [[require "plugins.configs.coq"]],
            requires = {
                { "ms-jpq/coq.artifacts", branch = "artifacts" },
                { "ms-jpq/coq.thirdparty", branch = "3p" },
            },
            run = ":COQdeps",
        }
        use { "s1n7ax/nvim-terminal", config = [[require("nvim-terminal").setup()]] }
        use {
            "terrortylor/nvim-comment",
            cmd = "CommentToggle",
            config = [[require("nvim_comment").setup()]],
            opt = true,
            setup = [[require("core.mappings").comment()]],
        }
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = { "NvimTreeToggle" },
            config = [[require "plugins.configs.nvimtree"]],
            opt = true,
            setup = [[require("core.mappings").nvimtree()]],
        }
        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            config = [[require "plugins.configs.telescope"]],
            requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
            setup = [[require("core.mappings").telescope()]],
        }
    end,
    config = {
        profile = { enable = true, threshold = 1 },
    },
}
