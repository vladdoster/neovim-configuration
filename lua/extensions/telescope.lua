local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then
  return
end
local actions = require('telescope.actions')
local project_actions = require("telescope._extensions.project.actions")
require"telescope".setup({
  defaults={
    initial_mode='insert',
    layout_config={prompt_position='top'},
    mappings={
      i={
        ["<C-n>"]=actions.cycle_history_next,
        ["<C-p>"]=actions.cycle_history_prev,
        ["<C-j>"]=actions.move_selection_next,
        ["<C-k>"]=actions.move_selection_previous
        -- ['<A-h>']=actions.toggle_preview,
      },
      n={q=actions.close}
    },
    -- mappings={
    --   i={

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
  extensions={
    project={
      base_dirs={
        {path='~/.config/nvim/', max_depth=2},
        {path='~/.config/zsh', max_depth=2},
        {path='~/.local/share/zinit', max_depth=2},
        {path='~/code', max_depth=3}
      },
      hidden_files=true,
      theme="ivy",
      order_by="asc",
      search_by="title",
      on_project_selected=function(prompt_bufnr)
        -- Do anything you want in here. For example:
        project_actions.change_working_directory(prompt_bufnr, false)
      end
    },
    fzf={case_mode='smart_case', fuzzy=true, override_file_sorter=true, override_generic_sorter=true}
  },
  pickers={find_files={theme='ivy'}, git_files={theme='ivy'}, live_grep={theme='ivy'}}
})

local map = vim.api.nvim_set_keymap
local silent = {silent=true, noremap=true}
-- open with the path of the current buffer
map("n", "<space>gb", ":Telescope git_files path=%:p:h select_buffer=true <CR>", silent)
map('n', '\'r', ":Telescope live_grep<CR>", silent)
map('n', '<C-p>', ":lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>", silent)

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua

