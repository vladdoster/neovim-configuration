local actions = require('telescope.actions')
local lactions = require('telescope.actions.layout')
require('telescope').setup({
  defaults={
    initial_mode='insert',
    layout_config={prompt_position='top'},
    mappings={
      i={
        ['<A-h>']=lactions.toggle_preview,
        ['<C-n>']=actions.move_selection_next,
        ['<C-p>']=actions.move_selection_previous,
        ['<ESC>']=actions.close,
        ['<S-TAB>']=actions.move_selection_previous,
        ['<TAB>']=actions.move_selection_next
      }
    },
    prompt_prefix=' ᐳ ',
    sorting_strategy='ascending'
  },
  extensions={fzf={case_mode='smart_case', fuzzy=true, override_file_sorter=true, override_generic_sorter=true}},
  pickers={find_files={theme='ivy'}, git_files={theme='ivy'}, live_grep={theme='ivy'}}
})

local map = vim.api.nvim_set_keymap
local silent = {silent=true, noremap=true}
-- open with the path of the current buffer
map("n", "<space>gb", ":Telescope git_files path=%:p:h select_buffer=true <CR>", silent)
map('n', '\'r', [[<cmd>Telescope live_grep<cr>]], silent)
