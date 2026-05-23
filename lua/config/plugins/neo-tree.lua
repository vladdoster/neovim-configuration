return {
  spec = { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', name = 'neo-tree.nvim', version = vim.version.range('*') },
  dependencies = {
    { src = 'https://github.com/nvim-lua/plenary.nvim', name = 'plenary.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons', name = 'nvim-web-devicons' },
    { src = 'https://github.com/MunifTanjim/nui.nvim', name = 'nui.nvim' },
  },
  setup = function()
    require('neo-tree').setup({
      close_if_last_window = true,
      name = { trailing_slash = true, use_git_status_colors = true, highlight = 'NeoTreeFileName' },
      window = { width = 25, mappings = { ['l'] = 'open', ['h'] = 'close_node' } },
      filesystem = { follow_current_file = { enabled = true }, hijack_netrw_behavior = 'open_current' },
    })
  end,
}
