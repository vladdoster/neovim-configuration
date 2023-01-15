local ok, telescope = pcall(require, 'telescope')
if not ok then return end
local actions = require 'telescope.actions'
local layout_actions = require 'telescope.actions.layout'

local opts = {noremap=true, silent=true}
vim.keymap.set({'n'}, '<C-p>p', [[<cmd>lua require('telescope').extensions.project.project()<CR>]], opts)
vim.keymap.set({'n'}, '<C-p>r', [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]], opts)
vim.keymap.set({'n'}, '<C-p>m', [[<cmd>lua require('telescope').extensions.make.make()<CR>]], opts)
vim.keymap.set({'n'}, '<C-p>g', [[<cmd>lua require('telescope').extensions.repo.list()<CR>]], opts)

require('telescope').setup {
  defaults={
    border={},
    borderchars={' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
    color_devicons=true,
    file_previewer=require('telescope.previewers').vim_buffer_cat.new,
    file_sorter=require('telescope.sorters').get_fzy_sorter,
    generic_sorter=require('telescope.sorters').get_generic_fuzzy_sorter,
    grep_previewer=require('telescope.previewers').vim_buffer_vimgrep.new,
    layout_strategy='flex',
    mappings={
      i={
        ['<C-j>']=actions.toggle_selection + actions.move_selection_next,
        ['<C-k>']=actions.toggle_selection + actions.move_selection_previous,
        ['<C-l>']=layout_actions.toggle_preview,
        ['<C-n>']=actions.cycle_history_next,
        ['<C-p>']=actions.cycle_history_prev,
        ['<C-q>']=actions.smart_send_to_qflist + actions.open_qflist,
        ['<C-w>']=function() vim.api.nvim_input '<c-s-w>' end,
        ['<Esc>']=actions.close,
        ['<S-Tab>']=actions.move_selection_previous,
        ['<Tab>']=actions.move_selection_next
      }
    },
    prompt_prefix='  ',
    qflist_previewer=require('telescope.previewers').vim_buffer_qflist.new,
    selection_caret='  ',
    selection_strategy='reset',
    set_env={['COLORTERM']='truecolor'},
    sorting_strategy='ascending',
    vimgrep_arguments={
      'rg',
      '--color=never',
      '--column',
      '--glob=!.git/',
      '--hidden',
      '--line-number',
      '--no-heading',
      '--smart-case',
      '--with-filename'
    },
    winblend=5
  },
  extensions={
    project={base_dirs={'~/.config/dotfiles/', '~/.config/nvim/', {path='~/code/', max_depth=2}}, hidden_files=true},
    recent_files={},
    repo={list={fd_opts={'--no-ignore-vcs'}, search_dirs={'~/.local/share/', '~/code'}}}
  }
}

local extensions = {'project', 'recent_files', 'repo'}
for _, ext in pairs(extensions) do require('telescope').load_extension(ext) end
