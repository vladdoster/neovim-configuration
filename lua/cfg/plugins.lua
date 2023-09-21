local ensure_impatient = function()
  pcall(require, 'impatient')
end
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
ensure_impatient()
ensure_packer()
-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_autocmd('BufWritePost', {
  group=vim.api.nvim_create_augroup('PACKER', {clear=true}),
  pattern='plugins.lua',
  command='source <afile> | PackerCompile'
})
return require('packer').startup({
  function(use)
    use('lewis6991/impatient.nvim')
    use('wbthomason/packer.nvim')
    -- UI
    use({
      {
        'folke/tokyonight.nvim',
        config=function()
          vim.cmd('colorscheme tokyonight')
        end
      },
      {
        'nvim-lualine/lualine.nvim',
        config=function()
          require('cfg.plugins.lualine')
        end
      }
    })
    use({
      'vladdoster/remember.nvim',
      config=function()
        require('remember')
      end,
      event='BufReadPost'
    })
    -- Treesitter for better highlights
    use({
      {
        'nvim-treesitter/nvim-treesitter',
        config=function()
          require('cfg.plugins.treesitter')
        end,
        event='CursorHold',
        requires={'nvim-lua/plenary.nvim'},
        run=':TSUpdate'
      },
      {'nvim-treesitter/nvim-treesitter-textobjects', after='nvim-treesitter'},
      {'nvim-treesitter/nvim-treesitter-refactor', after='nvim-treesitter'},
      {'JoosepAlviste/nvim-ts-context-commentstring', after='nvim-treesitter'},
      {
        'nvim-treesitter/nvim-treesitter-context',
        after='nvim-treesitter',
        config=function()
          require('treesitter-context').setup()
        end
      }
    })
    -- Editor UI Niceties --
    use({
      {
        'lukas-reineke/indent-blankline.nvim',
        config=function()
          require('cfg.plugins.indentline')
        end,
        event='BufReadPost'
      },
      {
        'lewis6991/gitsigns.nvim',
        config=function()
          require('cfg.plugins.gitsigns')
        end,
        event='BufReadPost'
      },
      {
        'norcalli/nvim-colorizer.lua',
        config=function()
          require('colorizer').setup()
        end,
        event='BufReadPost'
      },
      {
        'monaqa/dial.nvim',
        config=function()
          require('cfg.plugins.dial')
        end,
        event='CursorHold'
      },
      {
        'andymass/vim-matchup',
        config=function()
          vim.g.matchup_matchparen_offscreen = {method='status_manual'}
        end,
        event='CursorHold'
      }
    })
    use({
      'nvim-neo-tree/neo-tree.nvim',
      branch='v3.x',
      config=function()
        require('cfg.plugins.neo-tree')
      end,
      event='CursorHold',
      requires={
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim'
      }
    })
    -- Navigation and Fuzzy Search --
    use({
      {
        'nvim-telescope/telescope.nvim',
        config=function()
          require('cfg.plugins.telescope')
        end,
        event='CursorHold'
      },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        after='telescope.nvim',
        config=function()
          require('telescope').load_extension('fzf')
        end,
        run='make'
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        after='telescope.nvim',
        config=function()
          require('telescope').load_extension('ui-select')
        end
      }
      -- {
      --   "nvim-telescope/telescope-file-browser.nvim",
      --   after = "telescope.nvim",
      --   config = function()
      --     require("telescope").load_extension("file_browser")
      --   end,
      -- },
      -- {
      --   "nvim-telescope/telescope-symbols.nvim",
      --   after = "telescope.nvim",
      --   config = function()
      --     require("telescope").load_extension("file_browser")
      --   end,
      -- },
    })
    use({
      'numToStr/Navigator.nvim',
      config=function()
        require('cfg.plugins.navigator')
      end,
      event='CursorHold'
    })
    use({
      'phaazon/hop.nvim',
      config=function()
        require('cfg.plugins.hop')
      end,
      event='BufRead'
    })
    use({
      'karb94/neoscroll.nvim',
      config=function()
        require('neoscroll').setup({hide_cursor=true})
      end,
      event='WinScrolled'
    })
    use({'tpope/vim-surround', event='BufRead', requires={{'tpope/vim-repeat', event='BufRead'}}})
    use({'wellle/targets.vim', event='BufRead'})
    use({'AndrewRadev/splitjoin.vim', event='CursorHold'})
    use({
      'numToStr/Comment.nvim',
      config=function()
        require('Comment').setup({})
      end
    })
    -- Terminal --
    use({
      'numToStr/FTerm.nvim',
      config=function()
        require('cfg.plugins.fterm')
      end,
      event='CursorHold'
    })
    use({
      'neovim/nvim-lspconfig',
      event='BufRead',
      config=function()
        require('cfg.plugins.lsp.servers')
      end,
      requires={{'hrsh7th/cmp-nvim-lsp'}}
    })
    use({
      'jay-babu/mason-null-ls.nvim',
      event={'BufReadPre', 'BufNewFile'},
      requires={'williamboman/mason.nvim', 'jose-elias-alvarez/null-ls.nvim'},
      config=function()
        require('cfg.plugins.lsp.null-ls')
      end
    })
    -- use({
    --   'jose-elias-alvarez/null-ls.nvim',
    --   event='BufRead',
    --   config=function()
    --     require('cfg.plugins.lsp.null-ls')
    --   end
    -- })

    use({
      {
        'hrsh7th/nvim-cmp',
        event='InsertEnter',
        config=function()
          require('cfg.plugins.lsp.nvim-cmp')
        end,
        requires={
          {
            'L3MON4D3/LuaSnip',
            event='InsertEnter',
            config=function()
              require('cfg.plugins.lsp.luasnip')
            end,
            requires={{'rafamadriz/friendly-snippets', event='CursorHold'}}
          }
        }
      },
      {'saadparwaiz1/cmp_luasnip', after='nvim-cmp'},
      {'hrsh7th/cmp-path', after='nvim-cmp'},
      {'hrsh7th/cmp-buffer', after='nvim-cmp'}
    })
    -- NOTE: nvim-autopairs needs to be loaded after nvim-cmp, so that <CR> would work properly
    use({
      'windwp/nvim-autopairs',
      event='InsertCharPre',
      after='nvim-cmp',
      config=function()
        require('cfg.plugins.pairs')
      end
    })
    use({
      'echasnovski/mini.move',
      config=function()
        require('mini.move').setup()
      end,
      opt=true
    })
    use({
      'echasnovski/mini.splitjoin',
      config=function()
        require('mini.splitjoin').setup()
      end,
      opt=true
    })
    use({
      'junegunn/vim-easy-align',
      cmd='EasyAlign',
      config=function()
        require('cfg.plugins.vim-easy-align')
      end,
      opt=true
    })
    use({'obreitwi/vim-sort-folds', cmd='SortFolds', cond=vim.fn.executable('python3') == 1, opt=true})
    use({
      'sQVe/sort.nvim',
      cmd='Sort',
      config=function()
        require('cfg.plugins.sort')
      end,
      opt=true
    })
    use({ -- auto-resize windows
      'anuvyklack/windows.nvim',
      event='WinNew',
      requires={'anuvyklack/middleclass', 'anuvyklack/animation.nvim'},
      config=function()
        vim.o.winwidth = 5
        vim.o.equalalways = false
        require('windows').setup({animation={enable=false, duration=150}})
        require('cfg.keybinds').map('n', '<leader>m', '<cmd>WindowsMaximize<cr>')
      end
    })
    use({'dstein64/vim-startuptime', cmd='StartupTime', opt=true})
    use({
      'j-hui/fidget.nvim',
      tag='legacy',
      config=function()
        require('fidget').setup({})
      end
    })
  end,
  config={
    display={
      open_fn=function()
        return require('packer.util').float({border='single'})
      end
    }
  }
})

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
