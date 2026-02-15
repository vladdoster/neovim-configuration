require('lazy').setup({
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  -- require 'config.plugins.lint',
  require('config.plugins.autopairs'),
  require('config.plugins.blink-cmp'),
  require('config.plugins.conform'),
  require('config.plugins.dial'),
  require('config.plugins.gitsigns'),
  require('config.plugins.indent_line'),
  require('config.plugins.lspconfig'),
  require('config.plugins.mini'),
  require('config.plugins.neo-tree'),
  require('config.plugins.telescope'),
  require('config.plugins.tokyonight'),
  require('config.plugins.treesitter'),
  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    init = function() vim.g.startuptime_tries = 50 end,
  },
  {
    'cappyzawa/trim.nvim',
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

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
