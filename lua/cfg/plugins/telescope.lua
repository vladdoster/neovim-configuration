local actions = require('telescope.actions')
local lactions = require('telescope.actions.layout')
-- local fb_actions = require "telescope._extensions.file_browser.actions"
local _, fb_actions = pcall(require, "telescope._extensions.file_browser.actions")
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
  extensions={
    file_browser={
      theme="ivy",
      add_dirs=true,
      auto_depth=false,
      collapse_dirs=false,
      cwd_to_path=false,
      depth=1,
      dir_icon="",
      dir_icon_hl="Default",
      display_stat={date=true, size=true, mode=true},
      files=true,
      git_status=true,
      grouped=false,
      hidden=true,
      hide_parent_dir=false,
      hijack_netrw=true,
      prompt_path=false,
      quiet=false,
      select_buffer=false,
      use_fd=true,
      ["i"]={
        ["<A-c>"]=fb_actions.create,
        ["<A-d>"]=fb_actions.remove,
        ["<A-m>"]=fb_actions.move,
        ["<A-r>"]=fb_actions.rename,
        ["<A-y>"]=fb_actions.copy,
        ["<C-f>"]=fb_actions.toggle_browser,
        ["<C-g>"]=fb_actions.goto_parent_dir,
        ["<C-h>"]=fb_actions.toggle_hidden,
        ["<C-o>"]=fb_actions.open,
        ["<C-s>"]=fb_actions.toggle_all,
        ["<C-t>"]=fb_actions.change_cwd,
        ["<C-w>"]=fb_actions.goto_cwd,
        ["<S-CR>"]=fb_actions.create_from_prompt,
        ["<bs>"]=fb_actions.backspace
      }
    },
    fzf={case_mode='smart_case', fuzzy=true, override_file_sorter=true, override_generic_sorter=true}
  },
  pickers={find_files={theme='ivy'}, git_files={theme='ivy'}, live_grep={theme='ivy'}}
})

local map = vim.api.nvim_set_keymap
local silent = {silent=true, noremap=true}
-- open with the path of the current buffer
map("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true <CR>", silent)
map("n", "<space>gb", ":Telescope git_files path=%:p:h select_buffer=true <CR>", silent)
map('n', '\'r', [[<cmd>Telescope live_grep<cr>]], silent)
