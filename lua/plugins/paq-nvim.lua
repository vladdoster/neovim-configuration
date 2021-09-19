-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

vim.cmd 'packadd paq-nvim'            -- load paq
local paq = require('paq-nvim').paq   -- import module with `paq` function

require 'paq' {
  'savq/paq-nvim';  -- let paq manage itself
  'hoob3rt/lualine.nvim';
  'kyazdani42/nvim-web-devicons';
  'kyazdani42/nvim-tree.lua';
  'Yggdroot/indentLine';
  'nvim-treesitter/nvim-treesitter';
  'neovim/nvim-lspconfig';
  'hrsh7th/nvim-cmp';
  'hrsh7th/cmp-nvim-lsp';
  'kabouzeid/nvim-lspinstall';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-buffer';
  'saadparwaiz1/cmp_luasnip';
  'L3MON4D3/LuaSnip';
  'windwp/nvim-autopairs';
  'tanvirtin/monokai.nvim';
  'dstein64/vim-startuptime';
}

