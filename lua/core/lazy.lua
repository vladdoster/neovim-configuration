local lazypath = vim.fn.stdpath'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system{
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath
  }
end
vim.opt.rtp:prepend(lazypath)
-- protected call avoids error on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end
lazy.setup({
  spec={
    {
      "folke/tokyonight.nvim",
      priority=1000,
      config=function()
        vim.cmd.colorscheme'tokyonight'
      end
    },
    {'kyazdani42/nvim-web-devicons', lazy=true},
    {"monaqa/dial.nvim", keys={"<C-a>", {"<C-x>", mode="n"}}},
    {'lewis6991/gitsigns.nvim', dependencies={'nvim-lua/plenary.nvim'}, opts={}},
    {
      'nvim-neo-tree/neo-tree.nvim',
      branch='v3.x',
      event='CursorHold',
      dependencies={'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim'}
    },
    {'akinsho/toggleterm.nvim', cmd={'ToggleTerm', 'TermExec'}, opts={}},
    {'junegunn/vim-easy-align', cmd='EasyAlign', lazy=true},
    {'obreitwi/vim-sort-folds', cmd='SortFolds', cond=vim.fn.executable('python3') == 1, lazy=true},
    {'sQVe/sort.nvim', cmd='Sort', lazy=true},
    {
      'nvim-lualine/lualine.nvim',
      opts={options={icons_enabled=false, theme='onedark', component_separators='|', section_separators=''}}
    },

    {'nvim-treesitter/nvim-treesitter', dependencies={'nvim-treesitter/nvim-treesitter-textobjects'}, build=':TSUpdate'},
    {'lukas-reineke/indent-blankline.nvim', main='ibl', opts={}},
    {'windwp/nvim-autopairs', event='InsertEnter', opts={}},
    {'vladdoster/remember.nvim', config=[[ require('remember') ]]},
    {
      "numToStr/Comment.nvim",
      keys={
        {"gc", mode={"n", "v"}, desc="Comment toggle linewise"},
        {"gb", mode={"n", "v"}, desc="Comment toggle blockwise"}
      },
      opts={}
    },
    {"folke/neodev.nvim", opts={}},
    {'williamboman/mason.nvim', opts={}},
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason-lspconfig.nvim'},
    {
      'hrsh7th/nvim-cmp',
      event='InsertEnter',
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
      dependencies={
        {"nvim-telescope/telescope-fzf-native.nvim", enabled=vim.fn.executable"make" == 1, build="make"},
        {'nvim-telescope/telescope-project.nvim'}
      },
      lazy=true
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
