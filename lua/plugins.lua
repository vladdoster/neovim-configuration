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
  use {{'lewis6991/impatient.nvim'}, {'nvim-lua/plenary.nvim'}}
  -- UI
  use {
    {'MunifTanjim/nui.nvim'},
    {'nvim-lua/popup.nvim'},
    {'folke/tokyonight.nvim', config=cfg 'color-scheme'},
    {'nvim-lualine/lualine.nvim', config=cfg 'lualine'},
    {'rcarriga/nvim-notify', config=cfg 'notify'}
  }
  -- PRODUCTIVITY
  use {{'junegunn/vim-easy-align'}, {'tpope/vim-repeat'}, {'tpope/vim-surround'}, event='BufRead'}
  use {'akinsho/nvim-toggleterm.lua', config=cfg 'toggle-term'}
  use {'lewis6991/gitsigns.nvim', event={'BufRead', 'BufNewFile'}, config=cfg 'gitsigns'}
  use {'lukas-reineke/indent-blankline.nvim', config=cfg 'indentline'}
  use {'numToStr/Comment.nvim', event={'BufRead', 'BufNewFile'}, config=cfg 'comment'}
  use {'nvim-neo-tree/neo-tree.nvim', config=cfg 'neo-tree'}
  use {'sQVe/sort.nvim', config=[[require 'sort'.setup()]]}
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
    config=cfg 'treesitter'
  }
  -- COMPLETION
  use {'L3MON4D3/LuaSnip', after='friendly-snippets', config=cfg 'luasnip'}
  use {
    {'onsails/lspkind-nvim'},
    {'tamago324/cmp-zsh'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-path'},
    {'rafamadriz/friendly-snippets'},
    {'saadparwaiz1/cmp_luasnip'},
    after='nvim-cmp'
  }
  use {'hrsh7th/nvim-cmp', config=cfg 'cmp'}
  use {'williamboman/nvim-lsp-installer'}
  use {'neovim/nvim-lspconfig', after='cmp-nvim-lsp', config=cfg 'lsp'}
  use {'simrat39/symbols-outline.nvim', cmd='SymbolsOutline', setup=cfg 'symbols-outline'}

  use {'nvim-telescope/telescope.nvim', cmd='Telescope', module='telescope', config=cfg 'telescope'}
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    after='telescope.nvim',
    run='make',
    config=[[require('telescope').load_extension 'fzf']]
  }
  use {
    'antoinemadec/FixCursorHold.nvim',
    event={'BufRead', 'BufNewFile'},
    config=[[vim.g.cursorhold_updatetime = 100]]
  }
  if not warm_boot then packer.sync() end
end)
