local M = {}
local packer_status_ok, packer = pcall(require, 'packer')
if not packer_status_ok then return end
packer.startup({
  function(use)
    use({'wbthomason/packer.nvim'})
    use({'lewis6991/impatient.nvim'})
    use({'nathom/filetype.nvim'})
    use({
      'marko-cerovac/material.nvim',
      config = [[require 'plugins.color-scheme']]
    })
    use({'dstein64/vim-startuptime', cmd = 'StartupTime'})
    use({'nvim-lua/plenary.nvim'})
    use({'nvim-lua/popup.nvim'})
    use({'junegunn/vim-easy-align'})
    use({'tpope/vim-repeat'})
    use({'sQVe/sort.nvim', config = [[require 'sort'.setup()]]})
    use({'kyazdani42/nvim-tree.lua', config = [[require 'plugins.nvim-tree']]})
    use({
      'rafcamlet/tabline-framework.nvim',
      config = [[require 'plugins.tabline']]
    })
    use({'lukas-reineke/format.nvim', config = [[require 'plugins.format']]})
    use({
      'SmiteshP/nvim-gps',
      requires = 'nvim-treesitter/nvim-treesitter',
      wants = 'nvim-treesitter',
      module = 'nvim-gps',
      config = [[require("nvim-gps").setup({separator = " "})]]
    })
    use({
      'JoosepAlviste/nvim-ts-context-commentstring',
      module = 'ts_context_commentstring'
    })
    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      event = 'BufRead',
      cmd = {
        'TSInstall',
        'TSInstallInfo',
        'TSInstallSync',
        'TSUninstall',
        'TSUpdate',
        'TSUpdateSync',
        'TSDisableAll',
        'TSEnableAll'
      },
      config = [[require 'plugins.treesitter'.config()]],
      requires = {
        {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'},
        {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'},
        {
          'JoosepAlviste/nvim-ts-context-commentstring',
          after = 'nvim-treesitter'
        }
      }
    })
    use({'williamboman/nvim-lsp-installer'})
    use({'nvim-telescope/telescope-file-browser.nvim'})
    use({'nvim-telescope/telescope-fzf-native.nvim', run = 'make'})
    use({
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      config = [[require 'plugins.telescope'.config()]]
    })
    use({
      'akinsho/nvim-toggleterm.lua',
      cmd = 'ToggleTerm',
      config = [[require 'plugins.toggleterm'.config()]]
    })
    use({
      'lukas-reineke/indent-blankline.nvim',
      config = [[require 'plugins.indent-line'.config()]]
    })
    use({
      'folke/which-key.nvim',
      config = [[require 'plugins.which-key'.config()]]
    })
    use({'rcarriga/nvim-notify', config = [[require 'plugins.notify']]})
    use({
      'plasticboy/vim-markdown',
      event = 'VimEnter',
      ft = 'markdown',
      requires = {'godlygeek/tabular'}
    })
    use({
      'nvim-lualine/lualine.nvim',
      config = [[require("plugins.lualine").setup()]]
    })
    use({
      'neovim/nvim-lspconfig',
      event = 'BufRead',
      after = 'nvim-treesitter',
      config = [[require('plugins.lsp.servers')]],
      requires = {{'hrsh7th/cmp-nvim-lsp'}}
    })
    use({
      'jose-elias-alvarez/null-ls.nvim',
      event = 'BufRead',
      config = [[require('plugins.lsp.null-ls')]]
    })
    use({
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = [[require('plugins.lsp.nvim-cmp')]],
      requires = {
        {
          'L3MON4D3/LuaSnip',
          event = 'CursorHold',
          config = [[require('plugins.lsp.luasnip')]],
          requires = {'rafamadriz/friendly-snippets'}
        },
        {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'},
        {'hrsh7th/cmp-path', after = 'nvim-cmp'},
        {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
      }
    })
    use({
      'windwp/nvim-autopairs',
      event = 'InsertCharPre',
      after = 'nvim-cmp',
      config = [[require 'plugins.autopairs'.config()]]
    })
  end,
  config = {
    auto_clean = true,
    compile_on_sync = true,
    compile_path = vim.fn.stdpath('config') .. '/lua/packer_compiled.lua',
    display = {
      open_fn = function() return require('packer.util').float({
        border = 'rounded'
      }) end
    },
    git = {clone_timeout = 300},
    profile = {enable = true, threshold = 0.0001}
  }
})
return M
