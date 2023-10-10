local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
  return
end
local actions = require('telescope.actions')
telescope.setup({
  defaults={
    initial_mode='insert',
    layout_config={prompt_position='top'},
    mappings={
      i={
        ["<C-n>"]=actions.cycle_history_next,
        ["<C-p>"]=actions.cycle_history_prev,
        ["<C-j>"]=actions.move_selection_next,
        ["<C-k>"]=actions.move_selection_previous
      },
      n={q=actions.close}
    },
    -- mappings={
    --   i={
    --     ['<A-h>']=lactions.toggle_preview,
    --     ['<C-n>']=actions.move_selection_next,
    --     ['<C-p>']=actions.move_selection_previous,
    --     ['<ESC>']=actions.close,
    --     ['<S-TAB>']=actions.move_selection_previous,
    --     ['<TAB>']=actions.move_selection_next
    --   }
    -- },
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
