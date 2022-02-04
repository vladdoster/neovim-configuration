local present, packer = pcall(require, 'plugins.packerInit')
if not present then return false end
packer = require 'packer'
local use = packer.use
return packer.startup(function()
    use {'wbthomason/packer.nvim', event='VimEnter'}
    use {'lewis6991/impatient.nvim'}
    use {'dstein64/vim-startuptime', cmd='StartupTime'}
    use {'folke/tokyonight.nvim', config=[[vim.cmd 'colorscheme tokyonight']]}
    use {'famiu/feline.nvim', config=[[require 'plugins.feline']]}
    use {'norcalli/nvim-colorizer.lua', config=[[require 'colorizer'.setup()]]}
    use {'winston0410/commented.nvim', config=[[require 'commented'.setup()]]}
    use {'sQVe/sort.nvim', config=[[require("sort").setup()]]}
    use {
        'blackCauldron7/surround.nvim',
        config=[[require 'surround'.setup {mappings_style = "surround"} ]]
    }
    use {
        'ethanholz/nvim-lastplace',
        config=[[require 'surround'.setup {    lastplace_ignore_buftype = {"quickfix", "nofile", "help"}, lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"}, lastplace_open_folds = true} ]]
    }

    use {'junegunn/vim-easy-align'}
    use {'tpope/vim-repeat'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run=':TSUpdate',
        event='BufRead',
        config=[[require "plugins.treesitter"]]
    }
    use {'nvim-treesitter/playground', cmd='TSPlayground'}
    use {'p00f/nvim-ts-rainbow', after='nvim-treesitter'}
    use {'lewis6991/gitsigns.nvim', config=[[require "plugins.gitsigns" ]]}
    use {'lukas-reineke/format.nvim', config=[[require 'plugins.format']]}
    use {'akinsho/toggleterm.nvim', config=[[require 'plugins.terminal']]}
    use {
        'kyazdani42/nvim-tree.lua',
        cmd={'NvimTreeToggle', 'NvimTreeFocus'},
        config=[[require "plugins.nvimtree"]]
    }
    -- LSP completion
    use {
        'hrsh7th/nvim-cmp',
        after='friendly-snippets',
        config=[[require "plugins.cmp"]]
    }
    use {
        'L3MON4D3/LuaSnip',
        wants='friendly-snippets',
        after='nvim-cmp',
        config=[[require("plugins.others").luasnip()]]
    }
    use {'saadparwaiz1/cmp_luasnip', after='LuaSnip'}
    use {'hrsh7th/cmp-nvim-lua', after='nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp', after='nvim-cmp'}
    use {'lukas-reineke/cmp-rg', after='nvim-cmp'}
    use {'ray-x/cmp-treesitter', after='nvim-cmp'}
    use {'hrsh7th/cmp-path', after='nvim-cmp'}
    -- LSP
    use {'neovim/nvim-lspconfig', after='nvim-lsp-installer', requires='nvim-cmp'}
    use {
        'williamboman/nvim-lsp-installer',
        opt=true,
        setup=function()
            require('core.utils').packer_lazy_load 'nvim-lsp-installer'
            vim.defer_fn(function()
                vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
            end, 0)
        end,
        config=[[require "plugins.lspconfig"]]
    }
    use {
        'ray-x/lsp_signature.nvim',
        after='nvim-lspconfig',
        config=[[require("plugins.others").signature()]]
    }
    use {
        'folke/trouble.nvim',
        cmd='Trouble',
        config=[[require("trouble").setup()]]
    }
    use {'weilbith/nvim-code-action-menu', cmd='CodeActionMenu'}
    use {'rafamadriz/friendly-snippets', event='InsertEnter'}
    -- completion engine
    use {
        'nvim-telescope/telescope.nvim',
        cmd='Telescope',
        requires={
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                'nvim-lua/plenary.nvim',
                run='make -j'
            }
        },
        config=[[require 'plugins.telescope']]
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
    use {
        'phaazon/hop.nvim',
        cmd={'HopWord', 'HopLine', 'HopChar1', 'HopChar2', 'HopPattern'},
        as='hop',
        config=[[require('hop').setup()]]
    }
    use {'sindrets/diffview.nvim', after='neogit'}
    use {
        'TimUntersberger/neogit',
        cmd={'Neogit', 'Neogit commit'},
        config=[[require 'plugins.neogit']]
    }
    use {
        'michaelb/sniprun',
        run='bash ./install.sh',
        cmd='SnipRun',
        config=[[require'sniprun'.setup()]]
    }
end)
