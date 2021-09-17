local ok, packer = pcall(require, "plugins.packerInit")
if not ok then return false end

local use = packer.use

return packer.startup {
    function()
        use {"wbthomason/packer.nvim"}
        use {
            'kabouzeid/nvim-lspinstall',
            run = function()
                require("plugins.configs.lspinstall").install_servers()
            end,
            requires = {
                {
                    'neovim/nvim-lspconfig',
                    config = function()
                        require("plugins.configs.lspconfig")
                    end
                }
            }
        }

        use {
            "hoob3rt/lualine.nvim",
            config = function() require "plugins.configs.lualine" end
        }
        use {
            "marko-cerovac/material.nvim",
            config = function()
                require("plugins.configs.others").material()
            end
        }

        use {
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function() require "plugins.configs.bufferline" end,
            setup = function() require("core.mappings").bufferline() end
        }

        use {'unblevable/quick-scope'}

        use {
            'nvim-treesitter/nvim-treesitter',
            branch = '0.5-compat',
            run = ':TSUpdate',
            requires = {'nvim-treesitter/nvim-treesitter-textobjects'}
        }

        -- use { "godlygeek/tabular" }
        use {"tpope/vim-repeat"}
        use {"tpope/vim-surround"}

        use {
            "sbdchd/neoformat",
            cmd = "Neoformat",
            setup = function() require("core.mappings").neoformat() end
        }

        use {
            "lewis6991/gitsigns.nvim",
            config = function() require "plugins.configs.gitsigns" end
        }

        --         use {
        --             "neovim/nvim-lspconfig",
        --             after = "nvim-lspinstall",
        --             config = function() require "plugins.configs.lspconfig" end,
        --             requires = {
        --                 "kabouzeid/nvim-lspinstall", {
        --                     "ray-x/lsp_signature.nvim",
        --                     after = "nvim-lspconfig",
        --                     config = function()
        --                         require("plugins.configs.others").signature()
        --                     end
        --                 }, {
        --                     "onsails/lspkind-nvim",
        --                     config = function()
        --                         require("lspkind").init()
        --                     end
        --                 }
        --             }
        --         }
        use {
            'hrsh7th/nvim-cmp',
            config = function() require('plugins.configs.cmp') end,
            requires = {
                'dcampos/nvim-snippy', 'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-path', 'hrsh7th/cmp-emoji', 'hrsh7th/cmp-calc',
                'f3fora/cmp-spell'
            }
        }

        -- misc plugins
        use {
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = function()
                require("plugins.configs.others").autopairs()
            end
        }

        use {
            "jdhao/better-escape.vim",
            event = "InsertEnter",
            setup = function()
                require("plugins.configs.others").better_escape()
            end
        }

        use {
            "terrortylor/nvim-comment",
            cmd = "CommentToggle",
            config = function()
                require("plugins.configs.others").comment()
            end,
            setup = function() require("core.mappings").comment() end
        }

        use {
            's1n7ax/nvim-comment-frame',
            keys = '<leader>cf',
            requires = {'nvim-treesitter'},
            config = function() require'nvim-comment-frame'.setup() end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            cmd = {"NvimTreeToggle"},
            config = function() require "plugins.configs.nvimtree" end,
            opt = true,
            setup = function() require("core.mappings").nvimtree() end
        }

        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
            config = function() require "plugins.configs.telescope" end,
            setup = function() require("core.mappings").telescope() end
        }
        use {"lewis6991/impatient.nvim"}
        use {"dstein64/vim-startuptime", cmd = "StartupTime"}
    end,
    config = {profile = {enable = false, threshold = 1}}
}
