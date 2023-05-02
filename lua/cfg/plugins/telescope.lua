local actions = require('telescope.actions')
local lactions = require('telescope.actions.layout')
require('telescope').setup({
  defaults={
    initial_mode='insert',
    layout_config={prompt_position='top'},
    mappings={
      i={
        ['<C-h>']=lactions.toggle_preview,
        ['<C-j>']=actions.toggle_selection + actions.move_selection_next,
        ['<C-q>']=actions.send_to_qflist,
        ['<C-s>']=actions.send_selected_to_qflist,
        ['<ESC>']=actions.close,
        ['<S-TAB>']=actions.move_selection_previous,
        ['<TAB>']=actions.move_selection_next
      }
    },
    prompt_prefix=' ᐳ ',
    sorting_strategy='ascending'
  },
  extensions={
    fzf={
      case_mode='smart_case',
      fuzzy=true,
      override_file_sorter=true,
      override_generic_sorter=true
    }
  },
  pickers={
    find_files={theme='ivy'},
    git_files={theme='ivy'}
  }
})

local map = vim.api.nvim_set_keymap
local silent = {silent=true, noremap=true}
map('n', '\'f', [[<cmd>Telescope find_files<cr>]], silent)
map('n', '\'g', [[<cmd>Telescope git_files<cr>]], silent)
map('n', '\'r', [[<cmd>Telescope live_grep<cr>]], silent)
