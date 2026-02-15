-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {

    close_if_last_window = true,
    name = { trailing_slash = true, use_git_status_colors = true, highlight = 'NeoTreeFileName' },
    window = { width = 25, mappings = { ['l'] = 'open', ['h'] = 'close_node' } },
    filesystem = { follow_current_file = { enabled = true }, hijack_netrw_behavior = 'open_current' },
  },
}
