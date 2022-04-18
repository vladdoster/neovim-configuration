local warm_boot, packer = pcall(require, 'packer')
if not warm_boot then
  local packer_path = vim.fn.stdpath 'data' .. '/site/pack/packer/opt/packer.nvim'
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system {
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '1',
    packer_path
  }
  vim.cmd 'packadd packer.nvim'
  packer = require 'packer'
end
packer.init {
  auto_clean=true,
  compile_on_sync=true,
  git={clone_timeout=6000, subcommands={update='pull --ff-only --progress --rebase=true'}},
  profile={enable=true, threshold=0.0001}
}
local cfg = function(name) return string.format([[require("configs.%s")]], name) end
return packer.startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {
    'lewis6991/impatient.nvim',
    'nvim-lua/plenary.nvim',
    'tweekmonster/startuptime.vim',
    {
      'antoinemadec/FixCursorHold.nvim',
      event={'BufRead', 'BufNewFile'},
      config=[[vim.g.cursorhold_updatetime = 100]]
    }
  }
  -- UI
  use {
    {'folke/tokyonight.nvim', config=cfg 'color-scheme'},
    {'nvim-lualine/lualine.nvim', config=cfg 'lualine'},
    {'rcarriga/nvim-notify', config=cfg 'notify'},
    'MunifTanjim/nui.nvim',
    'nvim-lua/popup.nvim'
  }
  -- PRODUCTIVITY
  use {
    'junegunn/vim-easy-align',
    'obreitwi/vim-sort-folds',
    'tpope/vim-repeat',
    'tpope/vim-surround',
    {'numToStr/Buffers.nvim', event='BufRead'},
    {'vladdoster/remember.nvim', config=[[require 'remember']]},
    {'numToStr/Comment.nvim', event={'BufRead', 'BufNewFile'}, config=cfg 'comment'},
    {'sQVe/sort.nvim', config=[[require 'sort'.setup()]]}
  }
  use {
    'akinsho/nvim-toggleterm.lua',
    module='toggle-term',
    cmd='ToggleTerm',
    config=cfg 'toggle-term'
  }
  use {'lewis6991/gitsigns.nvim', event={'BufRead', 'BufNewFile'}, config=cfg 'gitsigns'}
  use {'lukas-reineke/indent-blankline.nvim', config=cfg 'indentline'}
  use {'nvim-neo-tree/neo-tree.nvim', module='neo-tree', cmd='Neotree', config=cfg 'neo-tree'}
  use {'jose-elias-alvarez/null-ls.nvim', event='BufRead', config=cfg 'null-ls'}
  -- use_rocks {'luaformatter', server = 'https://luarocks.org/dev'}
  -- TREESITTER
  use {
    {'p00f/nvim-ts-rainbow'},
    {'windwp/nvim-ts-autotag'},
    {'JoosepAlviste/nvim-ts-context-commentstring'},
    after='nvim-treesitter'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run=':TSUpdate',
    event={'BufRead', 'BufNewFile'},
    cmd={
      'TSDisableAll',
      'TSEnableAll',
      'TSInstall',
      'TSInstallInfo',
      'TSInstallSync',
      'TSUninstall',
      'TSUpdate',
      'TSUpdateSync'
    },
    config=cfg 'treesitter'
  }
  -- COMPLETION
  use {'rafamadriz/friendly-snippets', after='nvim-cmp'}
  use {'L3MON4D3/LuaSnip', after='friendly-snippets', config=cfg 'luasnip'}
  use {'hrsh7th/cmp-buffer', after='nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp', after='nvim-cmp'}
  use {'hrsh7th/cmp-path', after='nvim-cmp'}
  use {'saadparwaiz1/cmp_luasnip', after='nvim-cmp'}
  use {'hrsh7th/nvim-cmp', event='InsertEnter', config=cfg 'cmp', requires={'onsails/lspkind-nvim'}}
  use {
    'williamboman/nvim-lsp-installer',
    module='nvim-lsp-installer',
    cmd={
      'LspInstall',
      'LspInstallInfo',
      'LspPrintInstalled',
      'LspRestart',
      'LspStart',
      'LspStop',
      'LspUninstall',
      'LspUninstallAll'
    }
  }
  use {'neovim/nvim-lspconfig', event='BufWinEnter', config=cfg 'lsp'}
  use {'simrat39/symbols-outline.nvim', cmd='SymbolsOutline', setup=cfg 'symbols-outline'}
  -- FUZZY FINDER
  use {
    'nvim-telescope/telescope.nvim',
    cmd='Telescope',
    config=cfg 'telescope',
    module='Telescope',
    requires={
      {'nvim-telescope/telescope-github.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run='make'}
    }
  }
  if not warm_boot then packer.sync() end
end)
