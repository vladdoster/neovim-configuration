local M = {}
local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then return end
local actions, previewers, sorters = require 'telescope.actions', require 'telescope.previewers',
                                     require 'telescope.sorters'
M.common_keymaps = {
  ['<C-q>']=actions.send_to_qflist + actions.open_qflist,
  ['<C-t>']=actions.select_tab,
  ['<C-u>']=actions.preview_scrolling_up,
  ['<C-v>']=actions.select_vertical,
  ['<C-x>']=actions.select_horizontal,
  ['<CR>']=actions.select_default,
  ['<Down>']=actions.move_selection_next,
  ['<M-q>']=actions.send_selected_to_qflist + actions.open_qflist,
  ['<PageDown>']=actions.results_scrolling_down,
  ['<PageUp>']=actions.results_scrolling_up,
  ['<S-Tab>']=actions.results_scrolling_down,
  ['<Space>']=actions.toggle_selection + actions.move_selection_worse,
  ['<Tab>']=actions.results_scrolling_up,
  ['<Up>']=actions.move_selection_previous
}
-- merge function that takes functional approach
M.mergeMaps = function(keymaps)
  local c = {}
  for k, v in pairs(M.common_keymaps) do c[k] = v end
  for k, v in pairs(keymaps) do c[k] = v end
  return c
end
telescope.setup {
  border={},
  borderchars={'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
  buffer_previewer_maker=require('telescope.previewers').buffer_previewer_maker,
  color_devicons=false,
  extensions={
    fzf={
      case_mode='respect_case', -- "smart_case" | "ignore_case" | "respect_case"
      fuzzy=true,
      override_file_sorter=true,
      override_generic_sorter=true
    }
  },
  file_ignore_patterns={'node_modules', 'venv'},
  file_previewer=previewers.vim_buffer_cat.new,
  file_sorter=sorters.get_fuzzy_file,
  generic_sorter=sorters.get_generic_fuzzy_sorter,
  grep_previewer=previewers.vim_buffer_vimgrep.new,
  layout_config={
    horizontal={preview_width=0.55, prompt_position='top', results_width=0.8},
    vertical={mirror=false},
    height=0.80,
    preview_cutoff=120,
    width=0.87
  },
  layout_strategy='horizontal',
  mappings={
    i=M.mergeMaps {
      ['<C-c>']=actions.close,
      ['<C-j>']=actions.move_selection_next,
      ['<C-k>']=actions.move_selection_previous,
      ['<C-l>']=actions.complete_tag,
      ['<C-n>']=actions.cycle_history_next,
      ['<C-p>']=actions.cycle_history_prev
    },
    n=M.mergeMaps {
      ['<C-d>']=actions.preview_scrolling_down,
      ['<Esc>']=actions.close,
      ['G']=actions.move_to_bottom,
      ['H']=actions.move_to_top,
      ['L']=actions.move_to_bottom,
      ['M']=actions.move_to_middle,
      ['gg']=actions.move_to_top,
      ['j']=actions.move_selection_next,
      ['k']=actions.move_selection_previous
    }
  },
  path_display={'truncate'},
  prompt_prefix='ᐳ ',
  qflist_previewer=previewers.vim_buffer_qflist.new,
  selection_caret='―',
  selection_strategy='reset',
  set_env={['COLORTERM']='truecolor'},
  sorting_strategy='ascending',
  use_less=true,
  vimgrep_arguments={
    'rg',
    '--color=always',
    '--no-heading',
    '--with-filename',
    '--line-number',
    '--column',
    '--smart-case'
  },
  winblend=0
}
for _, x in pairs({'fzf', 'gh', 'notify'}) do telescope.load_extension(x) end
return M
