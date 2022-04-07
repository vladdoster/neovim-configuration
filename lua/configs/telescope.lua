local M = {}
local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then return end
local actions = require "telescope.actions"

local notify_ok, _ = pcall(require, "notify")
if notify_ok then telescope.load_extension "notify" end

M.common_keymaps = {
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
}

-- merge function that takes functional approach
M.mergeMaps = function(keymaps)
    local c = {}
    for k,v in pairs(M.common_keymaps) do c[k] = v end
    for k,v in pairs(keymaps) do c[k] = v end
    return c
end

telescope.setup{
    prompt_prefix = 'ᐳ ',
    selection_caret = "―",
    path_display = { "truncate" },
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    mappings = {
      i = M.mergeMaps({
        ["<C-c>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-l>"] = actions.complete_tag,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
      }),
      n = M.mergeMaps({
        ["<C-d>"] = actions.preview_scrolling_down,
        ["<Esc>"] = actions.close,
        ["G"] = actions.move_to_bottom,
        ["H"] = actions.move_to_top,
        ["L"] = actions.move_to_bottom,
        ["M"] = actions.move_to_middle,
        ["gg"] = actions.move_to_top,
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
      }),
    },
  pickers = {},
  extensions = {},
 }

return M
