local install_path = ('%s/site/pack/packer-lib/opt/packer.nvim'):format(vim.fn.stdpath 'data')
local function install_packer()
  vim.fn.termopen(('git clone https://github.com/wbthomason/packer.nvim %q'):format(install_path))
end
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then install_packer() end
vim.cmd [[packadd packer.nvim]]
function _G.packer_upgrade()
  vim.fn.delete(install_path, 'rf')
  install_packer()
end
vim.cmd [[command! PackerUpgrade :call v:lua.packer_upgrade()]]
local function spec(use)
  use {'lewis6991/impatient.nvim'}
  use {'tpope/vim-repeat', 'tpope/vim-surround'}
  use {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    'lewis6991/hover.nvim',
    'lewis6991/satellite.nvim',
    'stevearc/aerial.nvim',
    'ggandor/leap.nvim',
    'simnalamburt/vim-mundo',
    'airblade/vim-rooter',
    'stevearc/dressing.nvim',
    'linty-org/readline.nvim',
    'akinsho/toggleterm.nvim',
    'nvim-lualine/lualine.nvim',
    'numToStr/Comment.nvim',
    'windwp/nvim-autopairs',
    {'s1n7ax/nvim-window-picker', tag='v1.*'},
    {
      {'junegunn/vim-easy-align', cmd='EasyAlign', opt=true},
      {'obreitwi/vim-sort-folds', cmd='SortFolds', opt=true},
      {'sQVe/sort.nvim', cmd='Sort', config=setup('sort'), opt=true}
    },
    {
      'andymass/vim-matchup',
      setup=function()
        vim.g.matchup_matchparen_offscreen = {method='popup', fullwidth=1, highlight='OffscreenMatchPopup'}
      end
    },
    {
      'hrsh7th/nvim-cmp',
      requires={
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-path',
        'saadparwaiz1/cmp_luasnip',
        'petertriho/cmp-git',
        'onsails/lspkind-nvim',
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
  -- UI
  use {
    'olimorris/onedarkpro.nvim',
    'kyazdani42/nvim-web-devicons',
    'lukas-reineke/headlines.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'norcalli/nvim-colorizer.lua'
  }
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', cmd={'TSEnableAll', 'TSInstall', 'TSUpdate'}, run=':TSUpdate'}
  -- LSP
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'folke/lua-dev.nvim',
    'b0o/SchemaStore.nvim',
    'ray-x/lsp_signature.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'lvimuser/lsp-inlayhints.nvim',
    'j-hui/fidget.nvim',
    'SmiteshP/nvim-navic'
  }
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires={
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', run='make'}
    }
  }
  use 'lewis6991/gitsigns.nvim'
  use {'tweekmonster/startuptime.vim', cmd={'StartupTime'}}
  use 'wakatime/vim-wakatime'
end
require('packer').startup {spec, config={display={open_fn=require('packer.util').float}, max_jobs=10}}
