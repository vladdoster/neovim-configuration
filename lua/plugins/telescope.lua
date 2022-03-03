local M = {}
M.project_files = function(opts)
	opts = opts or {}
	local _git_pwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
	if vim.v.shell_error ~= 0 then
		local client = vim.lsp.get_active_clients()[1]
		if client then
			opts.cwd = client.config.root_dir
		end
		require("telescope.builtin").find_files(opts)
		return
	end
	require("telescope.builtin").git_files(opts)
end
function M.config()
	local status_ok, telescope = pcall(require, "telescope")
	if not status_ok then
		return
	end
	local actions = require("telescope.actions")
	local fb_actions = require("telescope").extensions.file_browser.actions
	telescope.load_extension("fzf")
	telescope.setup({
		defaults = {
			prompt_prefix = "-> ",
			selection_caret = "❯ ",
			path_display = { "smart" },
			layout_config = {
				height = 0.80,
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
					results_width = 0.8,
				},
				preview_cutoff = 120,
				vertical = { mirror = false },
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
					["<Leader>pf"] = M.project_files,
				},
			},
		},
		pickers = {},
	})
	require("telescope").load_extension("file_browser")
	require("telescope").load_extension("fzf")
end
return M

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {},
  extensions = {
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          ["<C-h>"] = fb_actions.goto_home_dir,
          ["<Leader>df"] = require("telescope.builtin").git_files({ cwd = "~/.config/dotfiles" }),
        },
        ["n"] = {},
      },
    },
  },
}
