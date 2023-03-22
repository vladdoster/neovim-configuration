local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd('packadd packer.nvim')
    return true
  end
  return false
end
ensure_packer()
-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group=vim.api.nvim_create_augroup('PACKER', {clear=true}),
  pattern='plugins.lua',
  command='source <afile> | PackerCompile'
})
pcall(require, 'impatient')
return require('packer').startup({
  function(use)
    use('lewis6991/impatient.nvim')
    use('wbthomason/packer.nvim')
    use('nvim-lua/plenary.nvim')
    -- Theme, Icons, Statusbar, Bufferbar --
    use({'kyazdani42/nvim-web-devicons', config=function() require('nvim-web-devicons').setup() end})
    use({'folke/tokyonight.nvim', config=function() require('cfg.plugins.tokyonight') end})
    use({
      'nvim-lualine/lualine.nvim',
      after='tokyonight.nvim',
      event='BufEnter',
      config=function() require('cfg.plugins.lualine') end
    })
    -- Treesitter: Better Highlights --
    use({
      {
        'nvim-treesitter/nvim-treesitter',
        event='CursorHold',
        run=function() pcall(require('nvim-treesitter.install').update {with_sync=true}) end,
        config=function() require('cfg.plugins.treesitter') end
      },
      {'JoosepAlviste/nvim-ts-context-commentstring', after='nvim-treesitter'},
      {
        'nvim-treesitter/nvim-treesitter-context',
        after='nvim-treesitter',

        config=function() require('treesitter-context').setup() end
      },
      {'nvim-treesitter/nvim-treesitter-refactor', after='nvim-treesitter'},
      {'nvim-treesitter/nvim-treesitter-textobjects', after='nvim-treesitter'}
    })
    -- Editor UI Niceties --
    use({
      'lukas-reineke/indent-blankline.nvim',
      event='BufRead',
      config=function() require('cfg.plugins.indentline') end
    })
    use({'norcalli/nvim-colorizer.lua', event='CursorHold', config=function() require('colorizer').setup() end})
    use({'lewis6991/gitsigns.nvim', event='BufRead', config=function() require('cfg.plugins.gitsigns') end})
    use({'sindrets/diffview.nvim', event='BufRead', config=function() require('cfg.plugins.diffview') end})
    use({'monaqa/dial.nvim', event='BufRead', config=function() require('cfg.plugins.dial') end})
    -- Navigation and Fuzzy Search --
    use {
      'nvim-neo-tree/neo-tree.nvim',
      branch='v2.x',
      event='CursorHold',
      config=function() require('cfg.plugins.neo-tree') end,
      requires={'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'}
    }
    use({
      {'nvim-telescope/telescope.nvim', event='CursorHold', config=function() require('cfg.plugins.telescope') end},
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        after='telescope.nvim',
        run='make',
        config=function() require('telescope').load_extension('fzf') end
      },
      {'nvim-telescope/telescope-symbols.nvim', after='telescope.nvim'}
    })
    use({'numToStr/Navigator.nvim', event='CursorHold', config=function() require('cfg.plugins.navigator') end})
    use({'phaazon/hop.nvim', event='BufRead', config=function() require('cfg.plugins.hop') end})
    use({
      'karb94/neoscroll.nvim',
      event='WinScrolled',
      config=function() require('neoscroll').setup({hide_cursor=false}) end
    })
    -- Editing to the MOON --
    use({'numToStr/Comment.nvim', event='BufRead', config=function() require('cfg.plugins.comment') end})
    use({'tpope/vim-surround', event='BufRead', requires={{'tpope/vim-repeat', event='BufRead'}}})
    use({'wellle/targets.vim', event='BufRead'})
    use({'AndrewRadev/splitjoin.vim', event='CursorHold'})
    use({'numToStr/Buffers.nvim', event='BufRead', config=function() require('cfg.plugins.buffers') end})
    -- Terminal --
    use({'numToStr/FTerm.nvim', event='CursorHold', config=function() require('cfg.plugins.fterm') end})
    -- LSP, Completions and Snippets --
    use({'jose-elias-alvarez/null-ls.nvim', event='BufRead', config=function() require('cfg.plugins.lsp.null-ls') end})
    use({
      'williamboman/mason.nvim',
      config=function() require('cfg.plugins.mason') end,
      requires={'WhoIsSethDaniel/mason-tool-installer.nvim'}
    })
    use({
      'neovim/nvim-lspconfig',
      event='BufRead',
      config=function() require('cfg.plugins.lsp.servers') end,
      requires={{'hrsh7th/cmp-nvim-lsp'}}
    })
    use({
      {
        'hrsh7th/nvim-cmp',
        event='InsertEnter',
        config=function() require('cfg.plugins.lsp.nvim-cmp') end,
        requires={
          {
            'L3MON4D3/LuaSnip',
            event='InsertEnter',
            config=function() require('cfg.plugins.lsp.luasnip') end,
            requires={{'rafamadriz/friendly-snippets', event='CursorHold'}}
          }
        }
      },
      {'saadparwaiz1/cmp_luasnip', after='nvim-cmp'},
      {'hrsh7th/cmp-path', after='nvim-cmp'},
      {'hrsh7th/cmp-buffer', after='nvim-cmp'}
    })
    use {'echasnovski/mini.move', config=function() require('mini.move').setup() end, opt=true}
    use {'echasnovski/mini.splitjoin',config=function() require('mini.splitjoin').setup() end, opt=true}

    use {'junegunn/vim-easy-align', cmd='EasyAlign', opt=true}
    use {'obreitwi/vim-sort-folds', cmd='SortFolds', cond=vim.fn.executable 'python3' == 1}
    use {'sQVe/sort.nvim', cmd='Sort', config=function() require('sort') end, opt=true}
    -- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
    use({
      'windwp/nvim-autopairs',
      event='InsertCharPre',
      after='nvim-cmp',
      config=function() require('cfg.plugins.pairs') end
    })
    use({'dstein64/vim-startuptime', cmd='StartupTime'})
    use({'j-hui/fidget.nvim', config=function() require('fidget').setup() end})
  end,
  config={display={open_fn=function() return require('packer.util').float({border='single'}) end}}
})
