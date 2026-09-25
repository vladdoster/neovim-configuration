require('lazy').setup({
  -- Detect tabstop and shiftwidth automatically
  { 'NMAC427/guess-indent.nvim', event = { 'BufReadPre', 'BufNewFile' }, opts = {} },
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    init = function() vim.g.startuptime_tries = 10 end,
  },
  {
    'cappyzawa/trim.nvim',
    -- Load on buffer events too: with `highlight`, setup() adds the BufEnter autocmds that draw the matches.
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'Trim', 'TrimToggle' },
    opts = {
      ft_blocklist = { 'markdown' },
      highlight = true,
      patterns = { [[%s/\(\n\n\)\n\+/\1/]] },
      trim_current_line = false,
      trim_on_write = false,
    },
  },
  {
    'vladdoster/remember.nvim',
    config = function() require('remember') end,
    lazy = false,
  },
  { import = 'config.plugins' },
}, {
  defaults = { lazy = true },
  performance = {
    rtp = {
      disabled_plugins = { 'gzip', 'netrwPlugin', 'rplugin', 'spellfile', 'tarPlugin', 'tutor', 'zipPlugin' },
    },
  },
  rocks = { enabled = false },
  ui = {
    -- A Nerd Font uses lazy.nvim's default icons. Other fonts get plain Unicode symbols.
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘ ',
      config = '✎',
      debug = '● ',
      event = '◷ ',
      favorite = '★ ',
      ft = '▤ ',
      import = '↳ ',
      init = '◎ ',
      keys = '⌥ ',
      lazy = '☾ ',
      plugin = '◆ ',
      require = '☽ ',
      runtime = '▣ ',
      source = '§ ',
      start = '▸ ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
