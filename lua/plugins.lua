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
    packer_path,
  }
  vim.cmd 'packadd packer.nvim'
  packer = require 'packer'
end
packer.init {
  auto_clean = true,
  compile_on_sync = true,
  git = {
    clone_timeout = 6000,
    subcommands = {
      update = 'pull --ff-only --progress --rebase=true',
    },
  },
  profile = { enable = true, threshold = 0.0001 },
}
local cfg = function(name)
  return string.format([[require("configs.%s")]], name)
end
return packer.startup(function(use)
  use { 'lewis6991/impatient.nvim' }
  use {
    'antoinemadec/FixCursorHold.nvim',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  }
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'folke/tokyonight.nvim', config = cfg 'color-scheme' }
  use { 'rcarriga/nvim-notify', config = cfg 'notify' }
  use {
    'stevearc/dressing.nvim',
    event = 'BufWinEnter',
    config = cfg 'dressing',
  }
  use {
    'nvim-lualine/lualine.nvim',
    config = cfg 'lualine',
    event = 'BufEnter',
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = cfg 'nvim-tree',
    event = 'CursorHold',
  }
  use { 'lewis6991/gitsigns.nvim', config = cfg 'gitsigns', event = 'BufRead' }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = cfg 'indentline',
    event = 'BufRead',
  }
  use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }
  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    after = 'nvim-treesitter',
  }
  -- EDITING
  use { 'junegunn/vim-easy-align' }
  use { 'sQVe/sort.nvim', config = [[require 'sort'.setup()]] }
  use { 'numToStr/Comment.nvim', config = cfg 'comment', event = 'BufRead' }
  use { 'tpope/vim-surround', event = 'BufRead' }
  use { 'tpope/vim-repeat', event = 'BufRead' }
  use { 'akinsho/toggleterm.nvim', config = cfg 'toggle-term' }
  use {
    'nvim-treesitter/nvim-treesitter',
    cmd = {
      'TSDisableAll',
      'TSEnableAll',
      'TSInstall',
      'TSInstallInfo',
      'TSInstallSync',
      'TSUninstall',
      'TSUpdate',
      'TSUpdateSync',
    },
    config = cfg 'treesitter',
    event = 'BufRead',
    run = ':TSUpdate',
  }
  -- TELESCOPE
  use {
    'nvim-telescope/telescope.nvim',
    config = cfg 'telescope',
    event = 'CursorHold',
  }
  use { 'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim' }
  -- LSP, COMPLETIONS, AND SNIPPETS
  use {
    'neovim/nvim-lspconfig',
    config = cfg 'lsp.servers',
    event = 'BufRead',
    requires = {
      { 'williamboman/nvim-lsp-installer', 'hrsh7th/cmp-nvim-lsp' },
    },
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    config = cfg 'lsp.null-ls',
    event = 'BufRead',
  }
  use { 'folke/trouble.nvim', config = cfg 'trouble' }
  use { 'rafamadriz/friendly-snippets', after = 'nvim-cmp' }
  use {
    'L3MON4D3/LuaSnip',
    after = 'friendly-snippets',
    config = cfg 'lsp.luasnip',
  }
  use { 'hrsh7th/nvim-cmp', config = cfg 'lsp.cmp', event = 'InsertEnter' }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }
  use {
    'j-hui/fidget.nvim',
    after = 'nvim-cmp',
    config = [[require('fidget').setup{}]],
  }
  use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }
  use { 'windwp/nvim-autopairs', after = 'nvim-cmp', config = cfg 'pairs' }
  if not warm_boot then
    packer.sync()
  end
end)
