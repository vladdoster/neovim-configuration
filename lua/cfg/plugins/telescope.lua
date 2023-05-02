local actions = require('telescope.actions')
local lactions = require('telescope.actions.layout')
local finders = require('telescope.builtin')
require('telescope').setup({
  defaults={
    prompt_prefix=' ᐳ ',
    initial_mode='insert',
    sorting_strategy='ascending',
    layout_config={prompt_position='top'},
    mappings={
      i={
        ['<ESC>']=actions.close,
        ['<TAB>']=actions.move_selection_next,
        ['<S-TAB>']=actions.move_selection_previous,
        ['<C-j>']=actions.toggle_selection + actions.move_selection_next,
        ['<C-s>']=actions.send_selected_to_qflist,
        ['<C-q>']=actions.send_to_qflist,
        ['<C-h>']=lactions.toggle_preview
      }
    }
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

-- LuaFormatter off
local btm = require('telescope.themes').get_ivy()
local silent, tbl = {silent=true, noremap=true}, table.unpack
map('n', '\'b', [[<cmd>Telescope buffers show_all_buffers=true<cr>]], silent)
map('n', '\'g', '', {tbl(silent), callback=function() finders.git_files(btm) end})
map('n', '\'f', '', {tbl(silent), callback=function() finders.find_files(btm) end})
map('n', '\'r', [[<cmd>Telescope live_grep<cr>]], silent)
-- LuaFormatter on
