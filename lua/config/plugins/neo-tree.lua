-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

-- The default neo-tree glyphs need a Nerd Font. Use these ASCII symbols with other fonts.
local ascii_components = {
  icon = { folder_closed = '+', folder_open = '-', folder_empty = '.', folder_empty_open = '.', selected = 'x' },
  indent = { expander_collapsed = '>', expander_expanded = 'v' },
  git_status = {
    symbols = {
      added = '+',
      deleted = '-',
      modified = '~',
      renamed = 'r',
      untracked = '?',
      ignored = 'i',
      unstaged = 'u',
      staged = 's',
      conflict = 'c',
    },
  },
}

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '3.*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', '<cmd>Neotree reveal<CR>', desc = 'NeoTree reveal' },
  },
  opts = {
    close_if_last_window = true,
    default_component_configs = vim.tbl_extend(
      'force',
      { name = { trailing_slash = true } },
      ascii_components
    ),
    window = { width = 25, mappings = { ['l'] = 'open', ['h'] = 'close_node' } },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = 'open_current',
      filtered_items = {
        -- Stay hidden even when `visible` is toggled on.
        never_show = { '.DS_Store', '.ruff_cache', 'superpowers' },
        -- Names with `cache` that start or end with `__`, for example `__pycache__`.
        never_show_by_pattern = { '__*cache*', '*cache*__' },
      },
    },
  },
}
