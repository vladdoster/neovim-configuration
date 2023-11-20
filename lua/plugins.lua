require"helpers/globals"

return {
  {
    "williamboman/mason.nvim",
    build=":MasonUpdate",
    dependencies={"williamboman/mason-lspconfig.nvim", 'folke/neodev.nvim', "neovim/nvim-lspconfig"},
    config=function()
      require"extensions.mason"
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch="v3.x",
    cmd="Neotree",
    config=function()
      require"extensions.neotree"
    end,
    dependencies={"MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim"},
    lazy=true
  },
  {"nvim-treesitter/nvim-treesitter-context", lazy=false, opts={mode='cursor'}},
  {
    "nvim-telescope/telescope.nvim",
    cmd="Telescope",
    config=function()
      require"extensions.telescope"
    end,
    dependencies={
      {"nvim-telescope/telescope-fzf-native.nvim", enabled=vim.fn.executable"make" == 1, build="make"},
      {'nvim-telescope/telescope-project.nvim'}
    },
    lazy=false
  },
  {
    'hrsh7th/nvim-cmp',
    event="InsertEnter",
    dependencies={
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lua',
      'rafamadriz/friendly-snippets'
    },
    config=function()
      require"extensions.cmp"
    end
  },
  {
    'onsails/lspkind-nvim',
    config=function()
      require"extensions.lspkind"
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    config=function()
      require"extensions.lualine"
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config=function()
      require"extensions.gitsigns"
    end
  },
  {"folke/trouble.nvim", dependencies={"kyazdani42/nvim-web-devicons"}},
  {
    "nvim-treesitter/nvim-treesitter",
    build=":TSUpdate",
    config=function()
      require"extensions.treesitter"
    end,
    event={"BufNewFile", "BufReadPost"},
    lazy=true
  },
  {
    'Wansmer/treesj',
    dependencies={'nvim-treesitter/nvim-treesitter'},
    keys={'<space>j', '<space>m', '<space>s'},
    opts={max_join_length=100}
  },
  {
    "dstein64/vim-startuptime",
    cmd="StartupTime",
    init=function()
      vim.g.startuptime_tries = 50
    end
  },
  {"monaqa/dial.nvim", keys={"<C-a>", {"<C-x>", mode="n"}}},
  {'akinsho/toggleterm.nvim', cmd={'TermExec', 'ToggleTerm'}, opts={}},
  {'junegunn/vim-easy-align', cmd='EasyAlign', lazy=true},
  {'numToStr/Comment.nvim', opts={}},
  {
    'obreitwi/vim-sort-folds',
    build="pip3 install pynvim",
    cmd='SortFolds',
    enabled=vim.fn.executable"pip3" == 1,
    lazy=true
  },
  {'sQVe/sort.nvim', cmd='Sort'},
  {"kylechui/nvim-surround", opts={}},
  {
    "folke/tokyonight.nvim",
    config=function()
      vim.cmd([[colorscheme tokyonight]])
    end,
    lazy=false,
    priority=1000
  },
  {
    'vladdoster/remember.nvim',
    config=function()
      require('remember')
    end,
    lazy=false,
    priority=2000
  }
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
