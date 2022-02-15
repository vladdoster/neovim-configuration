local M = {}
local packer_status_ok, packer = pcall(require, 'packer')
if not packer_status_ok then return end
packer.startup {
    function(use)
        use {'wbthomason/packer.nvim'}
        use {'lewis6991/impatient.nvim'}
        use {
            'ethanholz/nvim-lastplace',
            config=[[require'nvim-lastplace'.setup{}]]
        }
        use {
            'marko-cerovac/material.nvim',
            config=[[require("configs.color-scheme")]]
        }
        use {'dstein64/vim-startuptime', cmd='StartupTime'}
        use {'nvim-lua/plenary.nvim'}
        use {'nvim-lua/popup.nvim'}
        use {'junegunn/vim-easy-align'}
        use {'tpope/vim-repeat'}
        use {
            'winston0410/commented.nvim',
            config=[[require 'commented'.setup()]]
        }
        use {'sQVe/sort.nvim', config=[[require("sort").setup()]]}
        use {
            'kyazdani42/nvim-web-devicons',
            config=[[require("configs.icons").config()]]
        }
        use {
            'akinsho/bufferline.nvim',
            after='nvim-web-devicons',
            config=[[ require("configs.bufferline").config()]]
        }
        use {'famiu/feline.nvim', config=[[require("configs.feline")]]}
        use {'lukas-reineke/format.nvim', config=[[require 'configs.format']]}
        use {
            'nvim-treesitter/nvim-treesitter',
            run=':TSUpdate',
            event='BufRead',
            cmd={
                'TSInstall',
                'TSInstallInfo',
                'TSInstallSync',
                'TSUninstall',
                'TSUpdate',
                'TSUpdateSync',
                'TSDisableAll',
                'TSEnableAll'
            },
            config=[[require("configs.treesitter").config()]],
            requires={
                {'p00f/nvim-ts-rainbow', after='nvim-treesitter'},
                {'windwp/nvim-ts-autotag', after='nvim-treesitter'},
                {
                    'JoosepAlviste/nvim-ts-context-commentstring',
                    after='nvim-treesitter'
                }
            }
        }
        use {
            'L3MON4D3/LuaSnip',
            config=[[require("luasnip/loaders/from_vscode").lazy_load()]],
            requires={'rafamadriz/friendly-snippets'}
        }
        use {
            'hrsh7th/nvim-cmp',
            event='BufRead',
            config=[[require "configs.cmp"]]
        }
        use {'saadparwaiz1/cmp_luasnip', after='nvim-cmp'}
        use {'hrsh7th/cmp-buffer', after='nvim-cmp'}
        use {'hrsh7th/cmp-path', after='nvim-cmp'}
        use {'hrsh7th/cmp-nvim-lsp'}
        use {
            'williamboman/nvim-lsp-installer',
            event='BufRead',
            cmd={
                'LspInstall',
                'LspInstallInfo',
                'LspPrintInstalled',
                'LspRestart',
                'LspStart',
                'LspStop',
                'LspUninstall',
                'LspUninstallAll'
            }
        }
        use {
            'neovim/nvim-lspconfig',
            event='BufRead',
            config=[[require "configs.lsp"]]
        }
        use {
            'tami5/lspsaga.nvim',
            event='BufRead',
            config=[[require "configs.lsp.lspsaga".config()]]
        }
        use {
            'jose-elias-alvarez/null-ls.nvim',
            event='BufRead',
            config=[[require "configs.null-ls".config()]]
        }
        use {'nvim-telescope/telescope-file-browser.nvim'}
        use {'nvim-telescope/telescope-fzf-native.nvim', run='make'}
        use {
            'nvim-telescope/telescope.nvim',
            cmd='Telescope',
            config=[[require("configs.telescope").config()]]
        }
        use {
            'glepnir/dashboard-nvim',
            config=[[require "configs.dashboard".config()]]
        }
        use {
            'windwp/nvim-autopairs',
            after='nvim-cmp',
            event='InsertEnter',
            config=[[require "configs.autopairs".config()]]
        }
        use {
            'akinsho/nvim-toggleterm.lua',
            cmd='ToggleTerm',
            config=[[require("configs.toggleterm").config()]]
        }
        use {
            'numToStr/Comment.nvim',
            event='BufRead',
            config=[[require "configs.comment".config()]]
        }
        use {
            'lukas-reineke/indent-blankline.nvim',
            config=[[require("configs.indent-line").config()]]
        }
        use {
            'folke/which-key.nvim',
            config=[[require("configs.which-key").config()]]
        }
        use {
            'rcarriga/nvim-notify',
            config=function()
                vim.notify = require 'notify'
                require('notify').setup {
                    stages='slide',
                    timeout=2500,
                    minimum_width=50,
                    icons={
                        ERROR='',
                        WARN='',
                        INFO='',
                        DEBUG='',
                        TRACE='✎'
                    }
                }
            end
        }
    end,
    config={
        auto_clean=true,
        compile_on_sync=true,
        compile_path=vim.fn.stdpath 'config' .. '/lua/packer_compiled.lua',
        display={
            open_fn=function()
                return require('packer.util').float {border='rounded'}
            end
        },
        git={clone_timeout=300},
        profile={enable=true, threshold=0.0001}
    }
}
return M
