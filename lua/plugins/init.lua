local present, packer = pcall(require, "plugins.packer-init")
if not present then
    return false
end

local use = packer.use
return packer.startup {
    function()
        use {'wbthomason/packer.nvim'}
        use {'lewis6991/impatient.nvim'}
        use {'dstein64/vim-startuptime',    cmd = 'StartupTime'}
        use {'kyazdani42/nvim-web-devicons'}
        use {'marko-cerovac/material.nvim', config = [[require 'plugins.others'.material()]]}
        use {'famiu/feline.nvim',           config = [[require 'plugins.feline']]}
        use {'akinsho/nvim-bufferline.lua', config = [[require 'plugins.bufferline']]}
        use {'andymass/vim-matchup',        config = [[require 'plugins.matchup']]}
        use {'kyazdani42/nvim-tree.lua',    config = [[require 'plugins.nvimtree']]}
        use {'lewis6991/gitsigns.nvim',     config = [[require 'plugins.gitsigns']]}
        use {'lukas-reineke/format.nvim',   config = [[require 'plugins.format']]}
        use {'norcalli/nvim-colorizer.lua', config = [[require 'colorizer'.setup()]]}
        use {'s1n7ax/nvim-terminal',        config = [[require 'nvim-terminal'.setup()]]}
        use {'winston0410/commented.nvim',  config = [[require 'commented'.setup()]]}
        use {'blackCauldron7/surround.nvim'}
        use {'junegunn/vim-easy-align'}
        use {'tpope/vim-repeat' }
        use {'martinda/Jenkinsfile-vim-syntax'}
        use {'williamboman/nvim-lsp-installer'}
        use {'tami5/lspsaga.nvim', config = [[require 'plugins.lsp-saga']]}
        use {'neovim/nvim-lspconfig', config = [[require 'plugins.lsp-config']]}
        use {
            'hrsh7th/nvim-cmp',
            config   = [[require 'plugins.cmp']],
            requires = {
                {'L3MON4D3/LuaSnip', config = [[require 'plugins.others'.luasnip()]]},
                {'lukas-reineke/cmp-under-comparator'},
                {'f3fora/cmp-spell'},
                {'hrsh7th/cmp-buffer'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'hrsh7th/cmp-nvim-lua'},
                {'hrsh7th/cmp-path'},
                {'hrsh7th/cmp-vsnip'},
                {'onsails/lspkind-nvim'},
                {'rafamadriz/friendly-snippets', event = 'InsertEnter'},
                {'ray-x/cmp-treesitter'},
                {'saadparwaiz1/cmp_luasnip'}
            },
        }
        use {
            'nvim-telescope/telescope.nvim', -- fuzzy finder
            cmd      = 'Telescope',
            config   = [[require 'plugins.telescope']],
            module   = 'telescope',
            requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
            setup    = [[require 'core.mappings'.telescope()]]
        }
        use {
            'nvim-treesitter/nvim-treesitter', -- syntax highlighting
            config = [[require 'plugins.treesitter']],
            event  = 'BufRead',
            run    = ':TSUpdate',
            requires = {
                {'nvim-treesitter/nvim-treesitter-refactor', opt    = true},
                {'nvim-treesitter/nvim-treesitter-textobjects', opt = true}
            },
        }
    end,
    config = {
        compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua',
        profile      = {enable = true, threshold = 1},
    },
}
