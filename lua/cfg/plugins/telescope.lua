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

local function files_fallback()
  vim.fn.system'git rev-parse --is-inside-work-tree'
  local dropdown = require('telescope.themes').get_ivy()
  if vim.v.shell_error == 0 then
    require('telescope.builtin').git_files(dropdown)
  else
    require('telescope.builtin').find_files(dropdown)
  end
end

local silent = {silent=true, noremap=true}
map('n', '\'b', [[<cmd>Telescope buffers show_all_buffers=true<cr>]], silent)
map('n', '<c-d>', '', {silent=true, noremap=true, callback=files_fallback})
map('n', '\'r', [[<cmd>Telescope live_grep<cr>]], silent)
map('n', '<c-p>', [[<cmd>Telescope commands <cr>]], silent)
