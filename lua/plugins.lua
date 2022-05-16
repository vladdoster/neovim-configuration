local packer = require 'util.packer'
local config = {
  profile = { enable = true, threshold = 0 },
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'single' }
    end,
  },
  opt_default = true,
  local_plugins = {},
}
local function plugins(use)
  use { 'wbthomason/packer.nvim' }
  use { 'nathom/filetype.nvim', opt = false, config = [[require 'config.filetype']] }
  use { 'stevearc/dressing.nvim', event = 'BufReadPre' }
  use { 'rcarriga/nvim-notify', event = 'VimEnter', config = [[vim.notify = require 'notify']] }
  use {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    wants = {
      'null-ls.nvim',
      'lua-dev.nvim',
      'cmp-nvim-lsp',
      'nvim-lsp-installer',
    },
    config = [[require 'config.lsp']],
    requires = {
      'jose-elias-alvarez/null-ls.nvim',
      'folke/lua-dev.nvim',
      'williamboman/nvim-lsp-installer',
    },
  }
  use {
    'SmiteshP/nvim-gps',
    config = [[require('nvim-gps').setup { separator = ' ' }]],
    module = 'nvim-gps',
    requires = 'nvim-treesitter/nvim-treesitter',
    wants = 'nvim-treesitter',
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
  use { 'numToStr/Comment.nvim', keys = { 'gc', 'gcc', 'gbc' }, config = [[require 'config.comments']] }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' },
    config = [[require 'config.treesitter']],
  }
  use { 'marko-cerovac/material.nvim', opt = false, config = [[require 'config.theme']] }
  use { 'glepnir/dashboard-nvim', opt = false, config = [[require('config.dashboard')]] }
  use { 'norcalli/nvim-terminal.lua', ft = 'terminal', config = [[require('terminal').setup()]] }
  use { 'nvim-lua/plenary.nvim', module = 'plenary' }
  use { 'MunifTanjim/nui.nvim', module = 'nui' }
  use { 'nvim-lua/popup.nvim', module = 'popup' }
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    config = [[require 'config.neo-tree']],
    cmd = { 'NeoTree', 'NeoTreeFocus', 'NeoTreeFocusToggle' },
    requires = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
  }
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
    },
  }
  use { 'lukas-reineke/indent-blankline.nvim', event = 'BufReadPre', config = [[require 'config.blankline']] }
  use { 'akinsho/nvim-bufferline.lua', event = 'BufReadPre', config = [[require 'config.bufferline']] }
  use { 'akinsho/nvim-toggleterm.lua', keys = '<M-`>', config = [[ require 'config.terminal' ]] }
  use { 'karb94/neoscroll.nvim', keys = { '<C-u>', '<C-d>', 'gg', 'G' }, config = [[ require 'config.scroll']] }
  use {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    requires = { 'nvim-lua/plenary.nvim' },
    wants = 'plenary.nvim',
    config = [[require 'config.gitsigns']],
  }
  use { 'nvim-lualine/lualine.nvim', event = 'VimEnter', config = [[require('config.lualine')]] }
  use { 'norcalli/nvim-colorizer.lua', event = 'BufReadPre', config = [[require 'config.colorizer']] }
  use {
    'phaazon/hop.nvim',
    keys = { 'gh' },
    cmd = { 'HopWord', 'HopChar1' },
    config = function()
      require('util').nmap('gh', '<cmd>HopWord<CR>')
      require('hop').setup {}
    end,
  }
  use { 'ggandor/lightspeed.nvim', keys = { 's', 'S', 'f', 'F', 't', 'T' }, config = [[require 'config.lightspeed']] }
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
  use { 'folke/persistence.nvim', event = 'BufReadPre', module = 'persistence', config = [[require('persistence').setup()]] }
  use { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' }
  use { 'mbbill/undotree', cmd = 'UndotreeToggle' }
  use { 'mjlbach/babelfish.nvim', module = 'babelfish' }
  use { 'folke/twilight.nvim', module = 'twilight' }
  use { 'folke/which-key.nvim', event = 'VimEnter', config = [[require 'config.keys']] }
  use {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewClose', 'DiffviewFocusFiles', 'DiffviewOpen', 'DiffviewToggleFiles' },
    module = 'diffview',
    config = [[require 'config.diffview']],
  }
  use { 'RRethy/vim-illuminate', event = 'CursorHold', module = 'illuminate', config = [[vim.g.Illuminate_delay = 1000]] }
  use { 'junegunn/vim-easy-align', cmd = 'EasyAlign' }
  use { 'obreitwi/vim-sort-folds', cmd = 'SortFolds' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'sQVe/sort.nvim', cmd = 'Sort', config = [[require 'sort'.setup()]] }
  use { 'andymass/vim-matchup', event = 'CursorMoved', config = [[vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }]] }
end

return packer.setup(config, plugins)
