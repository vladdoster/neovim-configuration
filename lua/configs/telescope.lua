local M = {}
function M.config()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    return
  end
  local actions = require "telescope.actions"
  local fb_actions = require "telescope".extensions.file_browser.actions
  telescope.load_extension "fzf"
  telescope.setup {
    defaults = {
      prompt_prefix = "-> ",
      selection_caret = "❯ ",
      path_display = { "smart" },
      layout_config = {
         height = 0.80,
         horizontal = { prompt_position = "top", preview_width = 0.55, results_width = 0.8 },
         preview_cutoff = 120,
         vertical = { mirror = false, },
         width = 0.87,
      },
      mappings = {
        i = {
          ["<C-c>"] = actions.close,
          ["<C-d>"] = actions.preview_scrolling_down,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-l>"] = actions.complete_tag,
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<C-t>"] = actions.select_tab,
          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-v>"] = actions.select_vertical,
          ["<C-x>"] = actions.select_horizontal,
          ["<CR>"] = actions.select_default,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<PageDown>"] = actions.results_scrolling_down,
          ["<PageUp>"] = actions.results_scrolling_up,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
        },
        n = {
          ["<C-d>"] = actions.preview_scrolling_down,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<C-t>"] = actions.select_tab,
          ["<C-u>"] = actions.preview_scrolling_up,
          ["<C-v>"] = actions.select_vertical,
          ["<C-x>"] = actions.select_horizontal,
          ["<CR>"] = actions.select_default,
          ["<Down>"] = actions.move_selection_next,
          ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          ["<PageDown>"] = actions.results_scrolling_down,
          ["<PageUp>"] = actions.results_scrolling_up,
          ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
          ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
          ["<Up>"] = actions.move_selection_previous,
          ["<esc>"] = actions.close,
          ["G"] = actions.move_to_bottom,
          ["H"] = actions.move_to_top,
          ["L"] = actions.move_to_bottom,
          ["M"] = actions.move_to_middle,
          ["gg"] = actions.move_to_top,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
        },
      },
    },
    pickers = {},
    extensions = {
      fzf = { fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",

      },
      file_browser = {
        theme = "ivy",
        mappings = {
            ["i"] = {
              ["<C-h>"] = fb_actions.goto_home_dir,
          },
            ["n"] = {
          }
        },
      },
    },
  }
  require('telescope').load_extension('file_browser')
end
return M
