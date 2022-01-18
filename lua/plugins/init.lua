local present, packer = pcall(require, 'plugins.packer-init')
if not present then return false end
local use = packer.use
return packer.startup {
    function()
        use {'wbthomason/packer.nvim'}
        use {'lewis6991/impatient.nvim'}
        use {'dstein64/vim-startuptime', cmd='StartupTime'}
        -- UI
        use {'folke/tokyonight.nvim', config=[[vim.cmd 'colorscheme tokyonight']]}
        use {'famiu/feline.nvim', config=[[require 'plugins.feline']]}
        use {'akinsho/nvim-bufferline.lua', config=[[require 'plugins.bufferline']]}
        use {'norcalli/nvim-colorizer.lua', config=[[require 'colorizer'.setup()]]}
        -- GENERAL
        use {'andymass/vim-matchup', config=[[require 'plugins.matchup']]}
        use {'kyazdani42/nvim-tree.lua', config=[[require 'plugins.nvimtree']]}
        use {'lewis6991/gitsigns.nvim', config=[[require 'plugins.gitsigns']]}
        use {'lukas-reineke/format.nvim', config=[[require 'plugins.format']]}
        use {'LudoPinelli/comment-box.nvim', config=[[require 'plugins.other'.comment_box()]]}
        -- Terminal
        use {'akinsho/toggleterm.nvim', config=[[require 'plugins.toggle-term']]}
        use {'winston0410/commented.nvim', config=[[require 'commented'.setup()]]}
        use {
            'blackCauldron7/surround.nvim',
            config=[[require 'surround'.setup {mappings_style = "surround"} ]]
        }
        use {'junegunn/vim-easy-align'}
        use {'tpope/vim-repeat'}
        use {'sotte/presenting.vim'}
        -- use {'kamykn/spelunker.vim'}
        -- LSP
        use {'williamboman/nvim-lsp-installer'}
        use {'tami5/lspsaga.nvim', config=[[require 'plugins.lsp-saga']]}
        use {
            'neovim/nvim-lspconfig',
            requires={'ray-x/lsp_signature.nvim'},
            config=[[require 'plugins.lsp-config']]
        }
        use {
            'hrsh7th/nvim-cmp',
            config=[[require 'plugins.cmp']],
            requires={
                {'L3MON4D3/LuaSnip', config=[[require 'plugins.other'.luasnip()]]},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},
                {'hrsh7th/cmp-path'},
                {'hrsh7th/cmp-vsnip'},
                {'onsails/lspkind-nvim'},
                {'rafamadriz/friendly-snippets'},
                {'lukas-reineke/cmp-under-comparator'},
                {'f3fora/cmp-spell'},
                {'hrsh7th/cmp-buffer'},
                {'ray-x/cmp-treesitter'},
                {'saadparwaiz1/cmp_luasnip'},
                {'petertriho/cmp-git'}
            }
        }
        use {
            'windwp/nvim-autopairs',
            after={'nvim-cmp'},
            config=[[require 'plugins.other'.autopairs()]]
        }
        use {
            'nvim-telescope/telescope.nvim', -- fuzzy finder
            cmd='Telescope',
            config=[[require 'plugins.telescope']],
            module='telescope',
            requires={
                {'nvim-telescope/telescope-fzf-native.nvim', run='make'},
                {'nvim-lua/popup.nvim'},
                {'nvim-lua/plenary.nvim'}
            },
            setup=[[require 'core.mappings'.telescope()]]
        }
        use {
            'nvim-treesitter/nvim-treesitter',
            config=[[require 'plugins.treesitter']],
            event='BufRead',
            run=':TSUpdate',
            requires={
                {'nvim-treesitter/nvim-treesitter-refactor', opt=true},
                {'nvim-treesitter/nvim-treesitter-textobjects', opt=true},
                {
                    'lewis6991/spellsitter.nvim',
                    config=[[require('spellsitter').setup {enable=true,spellchecker = 'vimfn'}]],
                    ft='md'
                }
            }
        }
    end,
    config={
        compile_path=vim.fn.stdpath('config') .. '/lua/packer_compiled.lua',
        profile={enable=true, threshold=1}
    }
}
