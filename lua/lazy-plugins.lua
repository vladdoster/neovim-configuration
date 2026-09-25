require('lazy').setup({
  { 'NMAC427/guess-indent.nvim', lazy = false }, -- Detect tabstop and shiftwidth automatically
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    init = function() vim.g.startuptime_tries = 10 end,
  },
  {
    'cappyzawa/trim.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('trim').setup({
        ft_blocklist = { 'markdown' },
        highlight = true,
        patterns = { [[%s/\(\n\n\)\n\+/\1/]] },
        trim_current_line = false,
        trim_on_write = false,
      })
    end,
  },
  {
    'vladdoster/remember.nvim',
    config = function() require('remember') end,
    lazy = false,
    priority = 2000,
  },
  { import = 'config.plugins' },
}, {
  defaults = { lazy = true },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      -- cmd = '⌘',
      -- config = '🛠',
      -- event = '📅',
      -- ft = '📂',
      -- init = '⚙',
      -- keys = '🗝',
      -- lazy = '💤 ',
      -- plugin = '🔌',
      -- require = '🌙',
      -- runtime = '💻',
      -- source = '📄',
      -- start = '🚀',
      -- task = '📌',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
