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
    dependencies={"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"},
    lazy=true,
    config=function()
      require"extensions.neotree"
    end
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
    lazy=true,
    config=function()
      require"extensions.cmp"
    end
  },
  {
    'onsails/lspkind-nvim',
    lazy=true,
    config=function()
      require"extensions.lspkind"
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy=true,
    config=function()
      require"extensions.lualine"
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy=true,
    config=function()
      require"extensions.gitsigns"
    end
  },
  {
    "folke/trouble.nvim",
    lazy=true,
    dependencies={"kyazdani42/nvim-web-devicons"},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy=true,
    build=":TSUpdate",
    event={"BufReadPost", "BufNewFile"},
    config=function()
      require"extensions.treesitter"
    end
  },
  -- {
  --   'Wansmer/treesj',
  --   keys={'<space>m', '<space>j', '<space>s'},
  --   dependencies={'nvim-treesitter/nvim-treesitter'},
  --   lazy=true,
  --   opts={max_join_length=100}
  -- },
  {
    "dstein64/vim-startuptime",
    cmd="StartupTime",
    init=function()
      vim.g.startuptime_tries = 50
    end
  },
  {"monaqa/dial.nvim", keys={"<C-a>", {"<C-x>", mode="n"}}},
  {'akinsho/toggleterm.nvim', cmd={'ToggleTerm', 'TermExec'}, opts={}},
  {'junegunn/vim-easy-align', cmd='EasyAlign'},
  {'numToStr/Comment.nvim', opts={}},
  {'obreitwi/vim-sort-folds', cmd='SortFolds', enabled=vim.fn.executable"pip3" == 1, build="pip3 install pynvim"},
  {'sQVe/sort.nvim', cmd='Sort'},
  {"kylechui/nvim-surround", opts={}},
  {
    'vladdoster/remember.nvim',
    config=function()
      require('remember')
    end,
    lazy=false,
    priority=2000
  },
  {
    "folke/tokyonight.nvim",
    lazy=false, -- make sure we load this during startup if it is your main colorscheme
    priority=1000, -- make sure to load this before all the other start plugins
    config=function()
      vim.cmd([[colorscheme tokyonight]])
    end
  }
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
