-- Only required if you have packer in your `opt` pack
vim.api.nvim_command([[packadd packer.nvim]])
-- Automatically run :PackerCompile whenever plugins.lua is updated with an autocommand:
vim.api.nvim_create_augroup('PACKER', {})
vim.api.nvim_create_autocmd('BufWritePost', {
  group = 'PACKER',
  pattern = 'plugins.lua',
  command = 'source <afile> | PackerCompile'
})
local cfg = function(name) return string.format('require(\'plugins.%s\')', name) end
return require('packer').startup({
  function(use)
    use({'wbthomason/packer.nvim', opt = true})
    use('nvim-lua/plenary.nvim')
    use({'kyazdani42/nvim-web-devicons', config = [[ require("nvim-web-devicons").setup()]]})
    use({'marko-cerovac/material.nvim', config = cfg('color-scheme')})
    use({
      {'nvim-lualine/lualine.nvim', event = 'BufEnter', config = cfg('lualine')},
      {'arkav/lualine-lsp-progress', after = 'lualine.nvim'}
    })
    use({
      {'nvim-treesitter/nvim-treesitter', event = 'CursorHold', run = ':TSUpdate', config = cfg('treesitter')},
      {'nvim-treesitter/playground', after = 'nvim-treesitter'},
      {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
      {'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter'},
      {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'}
    })
    -- Editor UI Niceties
    use({'lukas-reineke/indent-blankline.nvim', event = 'BufRead', config = cfg('indentline')})
    use({'norcalli/nvim-colorizer.lua', event = 'CursorHold', config = [[require("colorizer").setup()]]})
    use({'lewis6991/gitsigns.nvim', event = 'BufRead', config = cfg('gitsigns')})
    use({'rhysd/git-messenger.vim', event = 'BufRead', config = cfg('git-messenger')})
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
    use({'numToStr/Navigator.nvim', event = 'CursorHold', config = cfg('navigator')})
    use({'phaazon/hop.nvim', event = 'BufRead', config = cfg('hop')})
    -- EDITING
    use('junegunn/vim-easy-align')
    use({'sQVe/sort.nvim', config = [[require 'sort'.setup()]]})
    use({'numToStr/Comment.nvim', event = 'BufRead', config = cfg('comment')})
    use({'tpope/vim-surround', event = 'BufRead', requires = {{'tpope/vim-repeat', event = 'BufRead'}}})
    use({'wellle/targets.vim', event = 'BufRead'})
    use({'ntpeters/vim-better-whitespace', event = 'BufRead', config = cfg('whitespace')})
    use({'AndrewRadev/splitjoin.vim', event = 'CursorHold'})
    use({'numToStr/Buffers.nvim', event = 'BufRead', config = cfg('buffers')})
    -- TERMINAL
    use({'numToStr/FTerm.nvim', event = 'CursorHold', config = cfg('fterm')})
    -- LSP, COMPLETIONS, AND SNIPPETS
    use({
      'neovim/nvim-lspconfig',
      event = 'BufRead',
      config = cfg('lsp.servers'),
      requires = {{'williamboman/nvim-lsp-installer', 'hrsh7th/cmp-nvim-lsp'}}
    })
    use({'jose-elias-alvarez/null-ls.nvim', event = 'BufRead', config = cfg('lsp.null-ls')})
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
      {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
    })
    use({'windwp/nvim-autopairs', event = 'InsertCharPre', after = 'nvim-cmp', config = cfg('pairs')})
  end,
  config = {
    auto_clean = true,
    compile_on_sync = true,
    git = {clone_timeout = 6000},
    max_jobs = 5,
    profile = {enable = true, threshold = 1}
  }
})
