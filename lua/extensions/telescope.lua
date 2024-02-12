local telescope_status_ok, telescope = pcall(require, 'telescope')
if not telescope_status_ok then return end
local actions = require('telescope.actions')
local project_actions = require('telescope._extensions.project.actions')
require('telescope').setup({
  defaults = {
    initial_mode = 'insert',
    layout_config = { prompt_position = 'top' },
    mappings = {
      i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        -- ['<A-h>']=actions.toggle_preview,
      },
      n = { q = actions.close },
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
    prompt_prefix = ' ᐳ ',
    sorting_strategy = 'ascending',
  },
  extensions = {
    project = {
      base_dirs = {
        { path = '~/Downloads', max_depth = 4 },
        { '~/.config/dotfiles', max_depth = 3 },
        { '~/.config/nvim', max_depth = 3 },
        { '~/.config/zsh', max_depth = 3 },
        { '~/.hammerspoon', max_depth = 3 },
        { '~/.local/share/zinit', max_depth = 2 },
        { '~/code', max_depth = 2 },
      },
      hidden_files = true,
      theme = 'ivy',
      order_by = 'dsc',
      search_by = 'path',
      -- on_project_selected = function(prompt_bufnr)
      --   project_actions.change_working_directory(prompt_bufnr, false)
      -- require("harpoon.ui").nav_file(1)
      -- end,
    },
    fzf = {
      case_mode = 'smart_case',
      fuzzy = true,
      override_file_sorter = true,
      override_generic_sorter = true,
    },
  },
  pickers = {
    find_files = { theme = 'ivy' },
    git_files = { theme = 'ivy' },
    live_grep = { theme = 'ivy' },
  },
})

local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }
-- open with the path of the current buffer
map('n', '<space>gb', ':Telescope git_files path=%:p:h select_buffer=true <CR>', silent)
map('n', "'r", ':Telescope live_grep<CR>', silent)
-- map('n', '<C-p>', ":lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>", silent)
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  ":lua require'telescope'.extensions.project.project{display_type='full'}<CR>",
  { noremap = true, silent = true }
)

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
