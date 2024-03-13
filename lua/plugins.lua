require('helpers/globals')

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    config = function() require('extensions.lsp') end,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim', opts = { max_concurrent_installers = 50 } },
      { 'j-hui/fidget.nvim', opts = {} },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      -- Snippets
      { 'L3MON4D3/LuaSnip', build = (function() return 'make install_jsregexp' end)() },
      { 'rafamadriz/friendly-snippets' },
    },
  },
  {
    'sheerun/vim-polyglot',
    init = function() vim.g.polyglot_disabled = { 'autoindent', 'sensible' } end,
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    cmd = 'Neotree',
    config = function() require('extensions.neotree') end,
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    lazy = true,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    lazy = false,
    opts = { mode = 'cursor' },
  },
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    config = function() require('extensions.telescope') end,
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        enabled = vim.fn.executable('make') == 1,
        build = 'make',
      },
      { 'nvim-telescope/telescope-project.nvim' },
    },
    lazy = false,
  },
  {
    'onsails/lspkind-nvim',
    config = function() require('extensions.lspkind') end,
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function() require('extensions.lualine') end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('extensions.gitsigns') end,
  },

  -- { 'folke/trouble.nvim', dependencies = { 'kyazdani42/nvim-web-devicons' } },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function() require('extensions.indentlines') end,
    event = 'User FileOpened',
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function() require('extensions.treesitter') end,
    event = { 'BufNewFile', 'BufReadPost' },
    lazy = true,
  },
  -- {
  --   'stevearc/aerial.nvim',
  --   lazy = true,
  --   opts = {
  --     attach_mode = 'global',
  --     backends = { 'lsp', 'man', 'markdown', 'treesitter' },
  --     filter_kind = false,
  --     guides = { last_item = '└ ', mid_item = '├ ', nested_top = '│ ', whitespace = '  ' },
  --     keymaps = {
  --       ['[Y'] = 'actions.prev_up',
  --       ['[['] = false,
  --       ['[y'] = 'actions.prev',
  --       [']Y'] = 'actions.next_up',
  --       [']]'] = false,
  --       [']y'] = 'actions.next',
  --       ['{'] = false,
  --       ['}'] = false,
  --     },
  --     layout = { min_width = 28 },
  --     show_guides = true,
  --   },
  -- },
  {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    keys = { '<space>j', '<space>m', '<space>s' },
    opts = { max_join_length = 100 },
  },
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    init = function() vim.g.startuptime_tries = 50 end,
  },
  {
    'monaqa/dial.nvim',
    config = function()
      local augend = require('dial.augend')
      require('dial.config').augends:register_group({
        default = {
          augend.constant.alias.bool,
          augend.integer.alias.decimal,
          augend.semver.alias.semver,
        },
      })
    end,
    keys = {
      {
        '<C-a>',
        expr = true,
        function() return require('dial.map').inc_normal() end,
      },
      {
        '<C-x>',
        expr = true,
        function() return require('dial.map').dec_normal() end,
      },
    },
  },
  {
    'echasnovski/mini.surround',
    opts = { mappings = { add = 'gsa', delete = 'gsd', replace = 'gsr', update_n_lines = 'gsn' } },
  },
  { 'akinsho/toggleterm.nvim', cmd = { 'TermExec', 'ToggleTerm' }, opts = {} },
  { 'junegunn/vim-easy-align', cmd = 'EasyAlign', lazy = true },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'obreitwi/vim-sort-folds',
    build = 'pip3 install pynvim',
    cmd = 'SortFolds',
    enabled = vim.fn.executable('pip3') == 1,
    lazy = true,
  },
  {
    'sQVe/sort.nvim',
    cmd = 'Sort',
    keys = { { '<C-s>', ':Sort<cr>', mode = 'n', remap = true }, { '<C-s>', ':Sort<cr>', mode = 'v', remap = true } },
    lazy = true,
  },
  { 'kylechui/nvim-surround', opts = {} },
  {
    'folke/tokyonight.nvim',
    config = function() vim.cmd.colorscheme('tokyonight') end,
    lazy = false,
    priority = 1000,
  },
  {
    'vladdoster/remember.nvim',
    config = function() require('remember') end,
    lazy = false,
    priority = 2000,
  },
}

--  vim: set expandtab filetype=lua shiftwidth=4 tabstop=4 :
