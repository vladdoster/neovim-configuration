local warm_boot, packer = pcall(require, 'packer')
if not warm_boot then
  local packer_path = ('%s/site/pack/packer-lib/opt/packer.nvim'):format(vim.fn.stdpath 'data')
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path}
  vim.cmd 'packadd packer.nvim'
  packer = require 'packer'
end
packer.init {
  auto_clean=true,
  auto_reload_compiled=true,
  autoremove=false,
  compile_on_sync=true,
  -- display={non_interactive=true},
  git={clone_timeout=6000, subcommands={update='pull --ff-only --progress --rebase'}},
  profile={enable=true, threshold=0.0001},
  transitive_disable=false,
  transitive_opt=false
}
local setup = function(name) return string.format([[require('%s').setup{}]], name) end
return packer.startup(function(use)
  use {'lewis6991/impatient.nvim'}
  use { -- UI
    'olimorris/onedarkpro.nvim',
    'lukas-reineke/headlines.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'norcalli/nvim-colorizer.lua'
  }
  use {'tpope/vim-repeat', 'tpope/vim-surround', 'tpope/vim-fugitive', 'tpope/vim-unimpaired'}
  use {'kylechui/nvim-surround', tag='*'}
  use {
    'airblade/vim-rooter',
    'junegunn/vim-easy-align',
    'akinsho/toggleterm.nvim',
    'lewis6991/hover.nvim',
    'lewis6991/satellite.nvim',
    'numToStr/Comment.nvim',
    'nvim-lualine/lualine.nvim',
    'stevearc/aerial.nvim',
    'stevearc/dressing.nvim',
    'windwp/nvim-autopairs',
    {'lewis6991/gitsigns.nvim', config=function() require('gitsigns').setup() end},
    {'s1n7ax/nvim-window-picker'},
    {'sQVe/sort.nvim', cmd='Sort', config=setup('sort'), opt=true},
    {'vladdoster/remember.nvim', config=[[require 'remember']]},
    {
      'andymass/vim-matchup',
      event={'Bufenter', 'BufRead'},
      setup=function()
        vim.g.matchup_matchparen_offscreen = {method='popup', fullwidth=1, highlight='OffscreenMatchPopup'}
      end
    },
    -- Treesitter
    {'nvim-treesitter/nvim-treesitter', run=function() require('nvim-treesitter.install').update({with_sync=true}) end},
    {
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
    },
    {'junegunn/vim-peekaboo', setup=function() vim.g.peekaboo_compact = 0 end},
    {
      'nvim-neo-tree/neo-tree.nvim',
      branch='v2.x',
      requires={'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim'}
    },
    {
      'editorconfig/editorconfig-vim',
      setup=function()
        vim.g.EditorConfig_max_line_indicator = ''
        vim.g.EditorConfig_preserve_formatoptions = 1
      end
    }
  }
  use { -- LSP
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'folke/neodev.nvim',
    'b0o/SchemaStore.nvim',
    'ray-x/lsp_signature.nvim',
    'j-hui/fidget.nvim',
    'SmiteshP/nvim-navic',
    {'jose-elias-alvarez/null-ls.nvim', requires={'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig'}}
  }
  use { -- Telescope
    'nvim-telescope/telescope.nvim',
    requires={
      'ptethng/telescope-makefile',
      'cljoly/telescope-repo.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      'smartpde/telescope-recent-files',
      {'nvim-telescope/telescope-fzf-native.nvim', run='make'}
    }
  }

  use {'dstein64/vim-startuptime', cmd={'StartupTime'}}
  -- use {'wakatime/vim-wakatime'}
  if not warm_boot then packer.sync() end
end)
