-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- Plugin manager: lazy.nvim
-- URL: https://github.com/folke/lazy.nvim
-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Start setup
lazy.setup({
  spec={
    {
      "folke/tokyonight.nvim",
      lazy=false, -- make sure we load this during startup if it is your main colorscheme
      priority=1000, -- make sure to load this before all the other start plugins
      config=function()
        vim.cmd([[colorscheme tokyonight]])
      end
    },
    -- Icons
    {'kyazdani42/nvim-web-devicons', lazy=true},
    -- Dashboard (start screen)
    {"monaqa/dial.nvim", keys={"<C-a>", {"<C-x>", mode="n"}}},
    -- Git labels
    {
      'lewis6991/gitsigns.nvim',
      lazy=true,
      dependencies={'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons'},
      config=function()
        require('gitsigns').setup{}
      end
    },

    -- File explorer
    {
      'nvim-neo-tree/neo-tree.nvim',
      branch='v3.x',
      event='CursorHold',
      dependencies={'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'}
    },
    {
      'akinsho/toggleterm.nvim',
      cmd={'ToggleTerm', 'TermExec'},
      config=function()
        require('toggleterm').setup{}
      end
    },

    {'junegunn/vim-easy-align', cmd='EasyAlign', lazy=true},
    {'obreitwi/vim-sort-folds', cmd='SortFolds', cond=vim.fn.executable('python3') == 1, lazy=true},
    {'sQVe/sort.nvim', cmd='Sort', lazy=true},
    {'nvim-lualine/lualine.nvim'},
    -- Treesitter
    {'nvim-treesitter/nvim-treesitter', build=':TSUpdate'},
    -- Indent line
    {'lukas-reineke/indent-blankline.nvim', main='ibl', opts={}},
    -- Autopair
    {
      'windwp/nvim-autopairs',
      event='InsertEnter',
      config=function()
        require('nvim-autopairs').setup{}
      end
    },
    {'vladdoster/remember.nvim', config=[[ require('remember') ]]},
    {
      "numToStr/Comment.nvim",
      config=function()
        require('Comment').setup{}
      end,
      keys={
        {"gc", mode={"n", "v"}, desc="Comment toggle linewise"},
        {"gb", mode={"n", "v"}, desc="Comment toggle blockwise"}
      }
    },
    {
      "folke/neodev.nvim",
      config=function()
        require('neodev').setup{}
      end
    },
    {
      'williamboman/mason.nvim',
      config=function()
        require('mason').setup{}
      end
    },
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocomplete
    {
      'hrsh7th/nvim-cmp',
      event='InsertEnter',
      -- these dependencies will only be loaded when cmp loads
      -- dependencies are always lazy-loaded unless specified otherwise
      dependencies={
        'L3MON4D3/LuaSnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'saadparwaiz1/cmp_luasnip'
      }
    },
    {
      "nvim-telescope/telescope.nvim",
      cmd="Telescope",
      dependencies={{"nvim-telescope/telescope-fzf-native.nvim", enabled=vim.fn.executable"make" == 1, build="make"}}

    },
    {
      "dstein64/vim-startuptime",
      cmd="StartupTime",
      init=function()
        vim.g.startuptime_tries = 10
      end
    }
  }
})
