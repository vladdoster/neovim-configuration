local A = vim.api

local actions = require 'telescope.actions'
local telescope = require 'telescope'
local trouble = require 'trouble.providers.telescope'

telescope.setup {
  defaults = {
    prompt_prefix = 'ᐳ ',
    initial_mode = 'insert',
    sorting_strategy = 'ascending',
    layout_config = { prompt_position = 'top' },
    mappings = {
      i = {
        ['<ESC>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<TAB>'] = actions.toggle_selection + actions.move_selection_next,
        ['<C-s>'] = actions.send_selected_to_qflist,
        ['<C-q>'] = actions.send_to_qflist,
        ['<c-t>'] = trouble.open_with_trouble,
      },
    },
    n = {
      ['<c-t>'] = trouble.open_with_trouble,
    },
    extensions = {},
  },
}
_G.Telescope = setmetatable({}, {
  __index = function(_, k)
    if vim.bo.filetype == 'NvimTree' then
      A.nvim_command 'wincmd l'
    end
    return require('telescope.builtin')[k]
  end,
})
