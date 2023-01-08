local warm_boot, packer = pcall(require, 'packer')
if not warm_boot then
  local packer_path = ('%s/site/pack/packer-lib/opt/packer.nvim'):format(vim.fn.stdpath 'data')
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path}
  vim.cmd [[packadd packer.nvim]]
  packer = require 'packer'
end
-- packer.init {
--   auto_clean=true,
--   auto_reload_compiled=true,
--   autoremove=false,
--   compile_on_sync=true,
--   -- display={non_interactive=true},
--   git={clone_timeout=6000, subcommands={update='pull --ff-only --progress --rebase'}},
--   profile={enable=true, threshold=0.0001},
--   transitive_disable=false,
--   transitive_opt=false
-- }
local setup = function(name) return string.format([[require('%s').setup{}]], name) end

local packer_group = vim.api.nvim_create_augroup('Packer', {clear=true})
vim.api.nvim_create_autocmd('BufWritePost', {
  command='source <afile> | PackerCompile',
  group=packer_group,
  pattern=vim.fn.expand '$MYVIMRC'
})

return packer.startup(function(use)
  use {'lewis6991/impatient.nvim'}
  use 'wbthomason/packer.nvim'
  use { -- UI
    {'folke/tokyonight.nvim', config=function() vim.cmd [[colorscheme tokyonight]] end},
    'lukas-reineke/headlines.nvim',
    'lukas-reineke/indent-blankline.nvim',
    {'norcalli/nvim-colorizer.lua', config=function() require'colorizer'.setup() end}
  }
  use {'tpope/vim-repeat', 'tpope/vim-surround', 'tpope/vim-fugitive', 'tpope/vim-unimpaired'}
  use {'kylechui/nvim-surround', tag='*'}
  use {
    'akinsho/toggleterm.nvim',
    'godlygeek/tabular',
    'navarasu/onedark.nvim', -- theme inspired by atom
    'lukas-reineke/indent-blankline.nvim', -- add indentation guides even on blank lines
    'tpope/vim-sleuth', -- detect tabstop and shiftwidth automatically
    'lewis6991/hover.nvim',
    'lewis6991/satellite.nvim',
    'numToStr/Comment.nvim',
    'nvim-lualine/lualine.nvim',
    'stevearc/aerial.nvim',
    'stevearc/dressing.nvim',
    'windwp/nvim-autopairs',
    'monaqa/dial.nvim',
    {'junegunn/vim-easy-align', cmd='EasyAlign', opt=true},
    {'lewis6991/gitsigns.nvim', config=setup('gitsigns')},
    {
      'obreitwi/vim-sort-folds',
      cmd='SortFolds',
      cond=vim.fn.executable 'python3' == 1,
      run='python3 -m pip install --upgrade pynvim'
    },
    {'sQVe/sort.nvim', cmd='Sort', config=setup('sort'), opt=true},
    {'vladdoster/remember.nvim', config=[[require 'remember']]},
    {
      'andymass/vim-matchup',
      event={'Bufenter', 'BufRead'},
      setup=function()
        vim.g.matchup_matchparen_offscreen = {method='popup', fullwidth=1, highlight='OffscreenMatchPopup'}
      end
    },
    { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      run=function() pcall(require('nvim-treesitter.install').update {with_sync=true}) end
    },
    { -- Additional text objects via treesitter
      'nvim-treesitter/nvim-treesitter-textobjects',
      after='nvim-treesitter'
    },
    { -- Autocompletion
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
    {
      'nvim-neo-tree/neo-tree.nvim',
      branch='v2.x',
      requires={'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons'}
    }
  }
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires={
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'b0o/SchemaStore.nvim',
      'ray-x/lsp_signature.nvim',
      'SmiteshP/nvim-navic',
      {'folke/neodev.nvim', config=setup('neodev')},
      'jose-elias-alvarez/null-ls.nvim',
      -- Useful status updates for LSP
      'j-hui/fidget.nvim'
    }
  }
  use { -- Telescope
    'nvim-telescope/telescope.nvim',
    requires={
      'cljoly/telescope-repo.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      'smartpde/telescope-recent-files',
      {'nvim-telescope/telescope-fzf-native.nvim', run='make', cond=vim.fn.executable 'make' == 1}
    }
  }
  use {'dstein64/vim-startuptime', cmd='StartupTime'}
  -- use {'wakatime/vim-wakatime'}
  -- if not warm_boot then packer.sync() end
  if not warm_boot then
    packer.sync()
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
  end
end)
