local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end
packer = require('packer')
packer.init({
  display = {
    open_fn = function() return require('packer.util').float({border = 'single'}) end,
    prompt_border = 'single'
  },
  git = {clone_timeout = 6000},
  max_jobs = 5,
  auto_clean = true,
  compile_on_sync = true,
  profile = {enable = true, threshold = 1}
})
local cfg = function(name) return string.format('require(\'plugins.%s\')', name) end
local use_with_config = function(path, name) packer.use({path, config = cfg(name)}) end
packer.reset()
return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')
  use('lewis6991/impatient.nvim')
  use({'nathom/filetype.nvim', config = cfg('filetype')})
  use('dstein64/vim-startuptime')
  use('nvim-lua/plenary.nvim')
  use('nvim-lua/popup.nvim')
  use('junegunn/vim-easy-align')
  use('tpope/vim-repeat')
  use({'numToStr/Comment.nvim', config = cfg('comment')})
  use('antoinemadec/FixCursorHold.nvim')
  use({'akinsho/nvim-toggleterm.lua', config = cfg('toggleterm')})
  use({'lukas-reineke/indent-blankline.nvim', config = cfg('indent-line')})
  use({'marko-cerovac/material.nvim', config = cfg('color-scheme')})
  use({'nvim-lualine/lualine.nvim', config = cfg('lualine')})
  use({'nvim-telescope/telescope-file-browser.nvim'})
  use({'nvim-telescope/telescope.nvim', cmd = 'Telescope', config = cfg('telescope')})
  use({
    'nvim-neo-tree/neo-tree.nvim',
    requires = {'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'},
    config = cfg('neo-tree')
  })
  use({'rafcamlet/tabline-framework.nvim', config = cfg('tabline')})
  use({'sQVe/sort.nvim', config = [[require 'sort'.setup()]]})
  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use_with_config('rcarriga/nvim-notify', 'notify')
  use({
    'hrsh7th/nvim-cmp',
    config = cfg('cmp'),
    requires = {
      'onsails/lspkind-nvim',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp'
    }
  })
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')
  use({
    'neovim/nvim-lspconfig',
    config = cfg('lsp'),
    requires = {'williamboman/nvim-lsp-installer', 'tamago324/nlsp-settings.nvim', 'jose-elias-alvarez/null-ls.nvim'}
  })
  if packer_bootstrap then require('packer').sync() end
end)
