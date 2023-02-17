local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim'
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch='v2.x',
    requires={'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'MunifTanjim/nui.nvim'}
  }
  use {
    'lukas-reineke/headlines.nvim',
    'lukas-reineke/indent-blankline.nvim',
    {'folke/tokyonight.nvim', config=function() vim.cmd('colorscheme tokyonight') end}
  }
  use {'tpope/vim-repeat', 'tpope/vim-surround', 'tpope/vim-fugitive', 'tpope/vim-unimpaired'}
  use {'kylechui/nvim-surround', tag='*'}
  use {
    'SmiteshP/nvim-navic',
    'akinsho/toggleterm.nvim',
    'godlygeek/tabular',
    'lewis6991/hover.nvim',
    'lewis6991/satellite.nvim',
    'monaqa/dial.nvim',
    'numToStr/Comment.nvim',
    'nvim-lualine/lualine.nvim',
    'stevearc/dressing.nvim',
    'tpope/vim-sleuth',
    'windwp/nvim-autopairs'
  }
  use {'junegunn/vim-easy-align', cmd='EasyAlign', opt=true}
  use {'lewis6991/gitsigns.nvim', disable=vim.fn.executable 'git' == 0, config=function() require('gitsigns') end}
  use {'obreitwi/vim-sort-folds', cmd='SortFolds', cond=vim.fn.executable 'python3' == 1}
  use {'sQVe/sort.nvim', cmd='Sort', config=function() require 'sort' end, opt=true}
  use {'vladdoster/remember.nvim', config=function() require 'remember' end}
  use {
    'nvim-treesitter/nvim-treesitter',
    run=function()
      local ts_update = require('nvim-treesitter.install').update({with_sync=true})
      ts_update()
    end
  }
  use {'nvim-treesitter/nvim-treesitter-textobjects', after='nvim-treesitter'}
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires={
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-omni',
      'hrsh7th/cmp-path',
      'onsails/lspkind-nvim',
      'petertriho/cmp-git',
      'saadparwaiz1/cmp_luasnip',
      {'L3MON4D3/LuaSnip', requires={'rafamadriz/friendly-snippets'}}
    }
  }
  -- use {
  --   "williamboman/mason.nvim",
  --   "williamboman/mason-lspconfig.nvim",
  --   "neovim/nvim-lspconfig",
  -- }
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires={
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/SchemaStore.nvim',
      'ray-x/lsp_signature.nvim',
      {'folke/neodev.nvim', config=function() require('neodev').setup() end},
      'jose-elias-alvarez/null-ls.nvim',
      'j-hui/fidget.nvim'
    }
  }
  use { -- Telescope
    'nvim-telescope/telescope.nvim',
    requires={'cljoly/telescope-repo.nvim', 'nvim-telescope/telescope-project.nvim', 'smartpde/telescope-recent-files'}
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    after='telescope.nvim',
    config=function() require('telescope').load_extension 'fzf' end,
    disable=vim.fn.executable 'make' == 0,
    run='make'
  }
  use {'dstein64/vim-startuptime', cmd='StartupTime'}
  if packer_bootstrap then
    print '================================='
    print '   Plugins are being installed   '
    print '   Wait until Packer completes,  '
    print '      then restart nvim          '
    print '================================='
    require('packer').sync()
  end
end)
