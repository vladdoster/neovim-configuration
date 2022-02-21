local M = {}
local packer_status_ok, packer = pcall(require, 'packer')
if not packer_status_ok then return end
packer.startup {
  function(use)
    use {'wbthomason/packer.nvim'}
    use {'lewis6991/impatient.nvim'}
    use('nathom/filetype.nvim')
    use {
      'ethanholz/nvim-lastplace',
      config = [[require 'nvim-lastplace'.setup{}]],
    }
    use {
      'marko-cerovac/material.nvim',
      config = [[require 'plugins.color-scheme']],
    }
    use {'dstein64/vim-startuptime', cmd = 'StartupTime'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-lua/popup.nvim'}
    use {'junegunn/vim-easy-align'}
    use {'tpope/vim-repeat'}
    use {'sQVe/sort.nvim', config = [[require 'sort'.setup()]]}
    use {
      'kyazdani42/nvim-web-devicons',
      config = [[require 'plugins.icons'.config()]],
    }
    use {
      'rafcamlet/tabline-framework.nvim',
      config = [[require 'plugins.tabline']],
    }
    use {'lukas-reineke/format.nvim', config = [[require 'plugins.format']]}
    use {
      'SmiteshP/nvim-gps',
      requires = 'nvim-treesitter/nvim-treesitter',
      wants = 'nvim-treesitter',
      module = 'nvim-gps',
      config = [[require("nvim-gps").setup({separator = " "})]],
    }
    use {
      'numToStr/Comment.nvim',
      opt = true,
      keys = {'gc', 'gcc', 'gbc'},
      config = [[require("Comment").setup()]],
    }
    use {
      'JoosepAlviste/nvim-ts-context-commentstring',
      module = 'ts_context_commentstring',
    }
    use {
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
        'TSEnableAll',
      },
      config = [[require 'plugins.treesitter'.config()]],
      requires = {
        {'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'},
        {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'},
        {
          'JoosepAlviste/nvim-ts-context-commentstring',
          after = 'nvim-treesitter',
        },
      },
    }
    use {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      opt = true,
      config = [[require 'plugins.cmp']],
      wants = {'LuaSnip'},
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        {
          'L3MON4D3/LuaSnip',
          wants = 'friendly-snippets',
          config = [[require("plugins.snippets")]],
        },
        'rafamadriz/friendly-snippets',
        {
          module = 'nvim-autopairs',
          'windwp/nvim-autopairs',
          config = [[require("nvim-autopairs").setup()]],
        },
      },
    }
    use({'simrat39/symbols-outline.nvim', cmd = {'SymbolsOutline'}})
    use {
      'nvim-lualine/lualine.nvim',
      requires = {'rlch/github-notifications.nvim'},
      event = 'VimEnter',
      config = [[require('plugins.lualine')]],
      wants = 'nvim-web-devicons',
    }
    use {
      'williamboman/nvim-lsp-installer',
      event = 'BufRead',
      cmd = {
        'LspInstall',
        'LspInstallInfo',
        'LspPrintInstalled',
        'LspRestart',
        'LspStart',
        'LspStop',
        'LspUninstall',
      },
    }
    use {
      'neovim/nvim-lspconfig',
      event = 'BufRead',
      config = [[require 'plugins.lsp']],
    }
    use {
      'tami5/lspsaga.nvim',
      event = 'BufRead',
      config = [[require 'plugins.lsp.lspsaga'.config()]],
    }
    use {
      'jose-elias-alvarez/null-ls.nvim',
      event = 'BufRead',
      config = [[require 'plugins.null-ls'.config()]],
    }
    use {'nvim-telescope/telescope-file-browser.nvim'}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      config = [[require 'plugins.telescope'.config()]],
    }
    use {
      'glepnir/dashboard-nvim',
      config = [[require 'plugins.dashboard'.config()]],
    }
    use {
      'windwp/nvim-autopairs',
      after = 'nvim-cmp',
      event = 'InsertEnter',
      config = [[require 'plugins.autopairs'.config()]],
    }
    use {
      'akinsho/nvim-toggleterm.lua',
      cmd = 'ToggleTerm',
      config = [[require 'plugins.toggleterm'.config()]],
    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = [[require 'plugins.indent-line'.config()]],
    }
    use {
      'folke/which-key.nvim',
      config = [[require 'plugins.which-key'.config()]],
    }
    use {'rcarriga/nvim-notify', config = [[require 'plugins.notify']]}
  end,
  config = {
    auto_clean = true,
    compile_on_sync = true,
    compile_path = vim.fn.stdpath 'config' .. '/lua/packer_compiled.lua',
    display = {
      open_fn = function() return require('packer.util').float {
        border = 'rounded',
      } end,
    },
    git = {clone_timeout = 300},
    profile = {enable = true, threshold = 0.0001},
  },
}
return M
