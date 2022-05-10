local packer = require 'util.packer'

local config = {
  profile = {
    enable = true,
    threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  },
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  },
  opt_default = true,
  local_plugins = {},
}

local function plugins(use)
  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim' }
  use {
    'nathom/filetype.nvim',
    opt = false,
    config = function()
      require 'config.filetype'
    end,
  }
  use { 'stevearc/dressing.nvim', event = 'BufReadPre' }
  use {
    'rcarriga/nvim-notify',
    event = 'VimEnter',
    config = function()
      vim.notify = require 'notify'
    end,
  }
  -- LSP
  use {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    wants = {
      'null-ls.nvim',
      'lua-dev.nvim',
      'cmp-nvim-lsp',
      'nvim-lsp-installer',
    },
    config = function()
      require 'config.lsp'
    end,
    requires = {
      'jose-elias-alvarez/null-ls.nvim',
      'folke/lua-dev.nvim',
      'williamboman/nvim-lsp-installer',
    },
  }
  use {
    'SmiteshP/nvim-gps',
    requires = 'nvim-treesitter/nvim-treesitter',
    wants = 'nvim-treesitter',
    module = 'nvim-gps',
    config = function()
      require('nvim-gps').setup { separator = ' ' }
    end,
  }

  use { 'kazhala/close-buffers.nvim', cmd = 'BDelete' }
  use {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    config = function()
      require 'config.compe'
    end,
    wants = { 'LuaSnip' },
    requires = {
      { 'hrsh7th/cmp-nvim-lsp', module = 'cmp_nvim_lsp' },
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      {
        'L3MON4D3/LuaSnip',
        wants = 'friendly-snippets',
        config = function()
          require 'config.snippets'
        end,
      },
      'rafamadriz/friendly-snippets',
      {
        module = 'nvim-autopairs',
        'windwp/nvim-autopairs',
        config = function()
          require 'config.autopairs'
        end,
      },
    },
  }
  use { 'simrat39/symbols-outline.nvim', cmd = { 'SymbolsOutline' } }

  use {
    'numToStr/Comment.nvim',
    keys = { 'gc', 'gcc', 'gbc' },
    config = function()
      require 'config.comments'
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufRead',
    requires = {
      { 'nvim-treesitter/playground', cmd = 'TSHighlightCapturesUnderCursor' },
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-textsubjects',
    },
    config = [[require('config.treesitter')]],
  }

  -- Theme: color schemes
  -- use("tjdevries/colorbuddy.vim")
  use { 'folke/tokyonight.nvim', opt = false, config = [[require 'config.theme']] }
  -- Dashboard
  use { 'glepnir/dashboard-nvim', opt = false, config = [[require('config.dashboard')]] }
  use { 'norcalli/nvim-terminal.lua', ft = 'terminal', config = [[require('terminal').setup()]] }
  use { 'nvim-lua/plenary.nvim', module = 'plenary' }
  use { 'MunifTanjim/nui.nvim', module = 'nui' }
  use { 'nvim-lua/popup.nvim', module = 'popup' }

  use {
    'windwp/nvim-spectre',
    module = 'spectre',
    wants = { 'plenary.nvim', 'popup.nvim' },
    requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
  }
  -- use { 'kyazdani42/nvim-tree.lua', cmd = { 'NvimTreeToggle', 'NvimTreeClose' }, config = [[require 'config.tree']] }
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    config = [[require 'config.neo-tree']],
    cmd = { 'NeoTree', 'NeoTreeFocus', 'NeoTreeFocusToggle' },
    requires = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require 'config.telescope']],
    cmd = { 'Telescope' },
    module = 'telescope',
    keys = { '<leader><space>', '<leader>fz', '<leader>pp' },
    wants = {
      'plenary.nvim',
      'popup.nvim',
      'telescope-z.nvim',
      -- "telescope-frecency.nvim",
      'telescope-fzy-native.nvim',
      'telescope-project.nvim',
      'trouble.nvim',
      'telescope-symbols.nvim',
    },
    requires = {
      'nvim-telescope/telescope-z.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      -- { "nvim-telescope/telescope-frecency.nvim", requires = "tami5/sql.nvim" }
    },
  }
  -- Indent Guides and rainbow brackets
  use { 'lukas-reineke/indent-blankline.nvim', event = 'BufReadPre', config = [[require 'config.blankline']] }
  -- Tabs
  use { 'akinsho/nvim-bufferline.lua', event = 'BufReadPre', config = [[require 'config.bufferline']] }
  -- Terminal
  use {
    'akinsho/nvim-toggleterm.lua',
    keys = '<M-`>',
    config = function()
      require 'config.terminal'
    end,
  }
  -- Smooth Scrolling
  use {
    'karb94/neoscroll.nvim',
    keys = { '<C-u>', '<C-d>', 'gg', 'G' },
    config = function()
      require 'config.scroll'
    end,
  }
  use {
    'edluffy/specs.nvim',
    after = 'neoscroll.nvim',
    config = function()
      require 'config.specs'
    end,
  }
  -- Git Gutter
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    requires = { 'nvim-lua/plenary.nvim' },
    wants = 'plenary.nvim',
    config = function()
      require 'config.gitsigns'
    end,
  }
  use {
    'TimUntersberger/neogit',
    cmd = 'Neogit',
    config = function()
      require 'config.neogit'
    end,
  }
  use { 'rlch/github-notifications.nvim', module = 'github-notifications' }
  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    config = [[require('config.lualine')]],
  }
  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufReadPre',
    config = function()
      require 'config.colorizer'
    end,
  }

  use { 'npxbr/glow.nvim', cmd = 'Glow' }
  use {
    'plasticboy/vim-markdown',
    requires = 'godlygeek/tabular',
    ft = 'markdown',
  }
  use {
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = 'markdown',
    cmd = { 'MarkdownPreview' },
  }

  use {
    'phaazon/hop.nvim',
    keys = { 'gh' },
    cmd = { 'HopWord', 'HopChar1' },
    config = function()
      require('util').nmap('gh', '<cmd>HopWord<CR>')
      -- require("util").nmap("s", "<cmd>HopChar1<CR>")
      -- you can configure Hop the way you like here; see :h hop-config
      require('hop').setup {}
    end,
  }

  use {
    'ggandor/lightspeed.nvim',
    keys = { 's', 'S', 'f', 'F', 't', 'T' },
    config = function()
      require 'config.lightspeed'
    end,
  }
  use {
    'folke/trouble.nvim',
    event = 'BufReadPre',
    cmd = { 'TroubleToggle', 'Trouble' },
    config = function()
      require('trouble').setup {
        auto_open = false,
        use_diagnostic_signs = false, -- en
      }
    end,
  }
  use {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    module = 'persistence',
    config = function()
      require('persistence').setup()
    end,
  }
  use { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' }
  use { 'mbbill/undotree', cmd = 'UndotreeToggle' }
  use { 'mjlbach/babelfish.nvim', module = 'babelfish' }
  use { 'folke/twilight.nvim', module = 'twilight' }
  use {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require 'config.keys'
    end,
  }
  use {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewClose', 'DiffviewFocusFiles', 'DiffviewOpen', 'DiffviewToggleFiles' },
    module = 'diffview',
    config = function()
      require 'config.diffview'
    end,
  }

  use {
    'RRethy/vim-illuminate',
    event = 'CursorHold',
    module = 'illuminate',
    config = function()
      vim.g.Illuminate_delay = 1000
    end,
  }

  use { 'junegunn/vim-easy-align', cmd = 'EasyAlign' }
  use { 'obreitwi/vim-sort-folds', cmd = 'SortFolds' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'sQVe/sort.nvim', cmd = 'Sort', config = [[require 'sort'.setup()]] }

  use {
    'andymass/vim-matchup',
    event = 'CursorMoved',
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }
    end,
  }
end

return packer.setup(config, plugins)
