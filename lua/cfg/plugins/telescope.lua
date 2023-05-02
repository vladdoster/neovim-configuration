local actions = require('telescope.actions')
local lactions = require('telescope.actions.layout')
require('telescope').setup({
  defaults={
    prompt_prefix=' ᐳ ',
    initial_mode='insert',
    sorting_strategy='ascending',
    layout_config={prompt_position='top'},
    mappings={
      i={
        ['<C-h>']=lactions.toggle_preview,
        ['<C-j>']=actions.toggle_selection + actions.move_selection_next,
        ['<C-q>']=actions.send_to_qflist,
        ['<C-s>']=actions.send_selected_to_qflist,
        ['<ESC>']=actions.close,
        ['<S-TAB>']=actions.move_selection_previous,
        ['<TAB>']=actions.move_selection_next,
      }
    }
  },
  pickers = {
    find_files = {theme='ivy'},
    git_files = {theme='ivy'}
  },
  extensions={
    fzf={
      fuzzy=true,
      override_generic_sorter=true, -- override the generic sorter
      override_file_sorter=true, -- override the file sorter
      case_mode='smart_case' -- "smart_case" | "ignore_case" | "respect_case"
    }
  }
})

local map = vim.api.nvim_set_keymap
local silent = {silent=true, noremap=true}
map('n', '\'f', [[<cmd>Telescope find_files<cr>]], silent)
map('n', '\'g', [[<cmd>Telescope git_files<cr>]], silent)
map('n', '\'r', [[<cmd>Telescope live_grep<cr>]], silent)
