local present, packer = pcall(require, "plugins.packerInit")
if not present then
    return false
end

local use = packer.use

return packer.startup {
    function()
        use { "wbthomason/packer.nvim" } -- pkg manager
        use { "lewis6991/impatient.nvim" } -- plugin caching
        use { "dstein64/vim-startuptime", cmd = "StartupTime" } -- load time per plugin
        use {
            "marko-cerovac/material.nvim", -- color theme
            config = [[require "plugins.others".material()]],
        }
        use { "kyazdani42/nvim-web-devicons" } -- shapes
        use { "famiu/feline.nvim", config = [[require "plugins.feline"]] } -- statusbar
        use {
            "akinsho/nvim-bufferline.lua", -- buffer/tab bar
            config = [[require 'plugins.bufferline']],
        }
        use {
            "machakann/vim-sandwich", -- object wrapping
            "tpope/vim-repeat", -- expanded repeat capabilities
            'junegunn/vim-easy-align',
            {
                "andymass/vim-matchup", -- auto-wrap
                config = [[require 'plugins.matchup']],
            },
        }
        use {
            "sbdchd/neoformat", -- all-in-one formatter
            cmd = "Neoformat",
            opt = true,
        }
        use { "lewis6991/gitsigns.nvim", config = [[require "plugins.gitsigns"]] }
        use { "s1n7ax/nvim-terminal", config = [[require "nvim-terminal".setup()]] } -- persistent terminal
        use{'winston0410/commented.nvim', config = [[require 'commented'.setup()]] } -- commenting
        use {
            "kyazdani42/nvim-tree.lua", -- file manager
            config = [[require "plugins.nvimtree"]],
        }
        -- LSP
        use {
            "neovim/nvim-lspconfig", -- language server configuration
            requires = { "williamboman/nvim-lsp-installer" }, -- language server installer
            config = [[require "plugins.lspconfig"]],
            -- run = ":LspInstall bashls pyright sumneko_lua gopls terraformls tflint yamlls jsonls",
        }
        use {
            "ms-jpq/coq_nvim", -- auto-completion
            after = "nvim-lspconfig",
            branch = "coq",
            config = [[require "plugins.coq"]],
            requires = {
                { "ms-jpq/coq.artifacts", branch = "artifacts" }, -- snippets
                { "ms-jpq/coq.thirdparty", branch = "3p" }, -- misc. addons
            },
            run = ":COQdeps",
        }
        use {
            "nvim-treesitter/nvim-treesitter", -- syntax highlighting
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
            "nvim-telescope/telescope.nvim", -- fuzzy finder
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
