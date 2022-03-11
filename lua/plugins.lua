local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system{
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  }
  print'Installing packer close and reopen Neovim...'
  vim.cmd[[packadd packer.nvim]]
end
vim.cmd[[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
local status_ok, packer = pcall(require, 'packer')
if not status_ok then return end
packer.init{
  display = {open_fn = function() return require('packer.util').float{border = 'rounded'} end}
}
local cfg = function(name) return string.format('require("plugins.%s")', name) end
return packer.startup(function(use)
  use({'lewis6991/impatient.nvim'})
  use({'nathom/filetype.nvim'})
  use({'wbthomason/packer.nvim', event = 'VimEnter'})
  use('nvim-lua/plenary.nvim')
  use({'marko-cerovac/material.nvim', config = cfg('color-scheme')})
  use({'nvim-lualine/lualine.nvim', event = 'BufEnter', config = cfg('lualine')})
  use({
    {
      'nvim-treesitter/nvim-treesitter',
      event = 'CursorHold',
      run = ':TSUpdate',
      config = cfg('treesitter')
    },
    {'nvim-treesitter/playground', after = 'nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'},
    {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'}
  })
  -- Editor UI Niceties
  use({'lukas-reineke/indent-blankline.nvim', event = 'BufRead', config = cfg('indentline')})
  use({'lewis6991/gitsigns.nvim', event = 'BufRead', config = cfg('gitsigns')})
  -- Navigation and Fuzzy Search
  use({'kyazdani42/nvim-tree.lua', event = 'CursorHold', config = cfg('nvim-tree')})
  use({
    {'nvim-telescope/telescope.nvim', event = 'CursorHold', config = cfg('telescope')},
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = 'telescope.nvim',
      run = 'make',
      config = [[require("telescope").load_extension("fzf")]]
    },
    {'nvim-telescope/telescope-symbols.nvim', after = 'telescope.nvim'}
  })
  -- EDITING
  use('junegunn/vim-easy-align')
  use({'sQVe/sort.nvim', config = [[require 'sort'.setup()]]})
  use({'numToStr/Comment.nvim', event = 'BufRead', config = cfg('comment')})
  use({
    'tpope/vim-surround',
    event = 'BufRead',
    requires = {{'tpope/vim-repeat', event = 'BufRead'}}
  })
  use({'numToStr/Buffers.nvim', event = 'BufRead', config = cfg('buffers')})
  -- TERMINAL
  -- LSP, COMPLETIONS, AND SNIPPETS
  use({
    'neovim/nvim-lspconfig',
    event = 'BufRead',
    config = cfg('lsp.servers'),
    requires = {{'williamboman/nvim-lsp-installer', 'hrsh7th/cmp-nvim-lsp'}}
  })
  use({'jose-elias-alvarez/null-ls.nvim', event = 'BufRead', config = cfg('lsp.null-ls')})
  -- use_rocks{'luacheck', {'luaformatter', server = 'https://luarocks.org/dev'}}
  use({
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      config = cfg('lsp.nvim-cmp'),
      requires = {
        {
          'L3MON4D3/LuaSnip',
          event = 'CursorHold',
          config = cfg('lsp.luasnip'),
          requires = {'rafamadriz/friendly-snippets'}
        }
      }
    },
    {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'},
    {'hrsh7th/cmp-path', after = 'nvim-cmp'},
    {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
    {'j-hui/fidget.nvim', after = 'nvim-cmp', config = [[require('fidget').setup{}]]}
  })
  use({'windwp/nvim-autopairs', event = 'InsertCharPre', after = 'nvim-cmp', config = cfg('pairs')})
  if PACKER_BOOTSTRAP then require('packer').sync() end
end)
