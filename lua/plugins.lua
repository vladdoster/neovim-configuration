local warm_boot, packer = pcall(require, 'packer')
if not warm_boot then
  local packer_path = vim.fn.stdpath'data' .. '/site/pack/packer/opt/packer.nvim'
  vim.fn.delete(packer_path, 'rf')
  vim.fn.system{
    'git',
    'clone',
    'https://github.com/wbthomason/packer.nvim',
    '--depth',
    '20',
    packer_path
  }
  vim.cmd'packadd packer.nvim'
  packer = require('packer')
end
packer.init{auto_clean=true, compile_on_sync=true, git={clone_timeout=6000}}
local cfg = function(name) return string.format('require("plugins.%s")', name) end
return packer.startup(function(use)
  use({'lewis6991/impatient.nvim'})
  use({'nathom/filetype.nvim'})
  use({'wbthomason/packer.nvim'})
  use({'nvim-lua/plenary.nvim'})
  use({'marko-cerovac/material.nvim', config=cfg('color-scheme')})
  use({'nvim-lualine/lualine.nvim', config=cfg('lualine'), event='BufEnter'})
  use({
    {
      'nvim-treesitter/nvim-treesitter',
      config=cfg('treesitter'),
      event='CursorHold',
      run=':TSUpdate'
    },
    {'nvim-treesitter/nvim-treesitter-textobjects', after='nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-refactor', after='nvim-treesitter'},
    {'windwp/nvim-ts-autotag', after='nvim-treesitter'}
  })
  use({'lukas-reineke/indent-blankline.nvim', config=cfg('indentline'), event='BufRead'})
  use({'lewis6991/gitsigns.nvim', config=cfg('gitsigns'), event='BufRead'})
  use({'kyazdani42/nvim-tree.lua', config=cfg('nvim-tree'), event='CursorHold'})
  use({
    {'nvim-telescope/telescope.nvim', config=cfg('telescope'), event='CursorHold'},
    {'nvim-telescope/telescope-symbols.nvim', after='telescope.nvim'}
  })
  -- EDITING
  use('junegunn/vim-easy-align')
  use({'sQVe/sort.nvim', config=[[require 'sort'.setup()]]})
  use({'numToStr/Comment.nvim', config=cfg('comment'), event='BufRead'})
  use({'tpope/vim-surround', event='BufRead', requires={{'tpope/vim-repeat', event='BufRead'}}})
  -- TERMINAL
  -- LSP, COMPLETIONS, AND SNIPPETS
  use({
    'neovim/nvim-lspconfig',
    config=cfg('lsp.servers'),
    event='BufRead',
    requires={{'williamboman/nvim-lsp-installer', 'hrsh7th/cmp-nvim-lsp'}}
  })
  use({'jose-elias-alvarez/null-ls.nvim', config=cfg('lsp.null-ls'), event='BufRead'})
  -- use_rocks{'luacheck', {'luaformatter', server='https://luarocks.org/dev'}}
  use({
    {
      'hrsh7th/nvim-cmp',
      config=cfg('lsp.nvim-cmp'),
      event='InsertEnter',
      requires={
        {
          'L3MON4D3/LuaSnip',
          config=cfg('lsp.luasnip'),
          event='CursorHold',
          requires={'rafamadriz/friendly-snippets'}
        }
      }
    },
    {'onsails/lspkind-nvim'},
    {'saadparwaiz1/cmp_luasnip', after='nvim-cmp'},
    {'hrsh7th/cmp-path', after='nvim-cmp'},
    {'hrsh7th/cmp-buffer', after='nvim-cmp'},
    {'j-hui/fidget.nvim', after='nvim-cmp', config=[[require('fidget').setup{}]]},
    {'windwp/nvim-autopairs', after='nvim-cmp', config=cfg('pairs')}
  })
  if not warm_boot then packer.sync() end
end)
