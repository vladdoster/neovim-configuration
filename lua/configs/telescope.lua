local M = {}
local telescope_ok, telescope = pcall(require, 'telescope')
if not telescope_ok then return end
local actions, previewers, sorters = require 'telescope.actions', require 'telescope.previewers',
                                     require 'telescope.sorters'

telescope.setup {
  defaults={
    vimgrep_arguments={
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--trim'
    },
    buffer_previewer_maker=require('telescope.previewers').buffer_previewer_maker,
    color_devicons=false,
    extensions={
      fzf={case_mode='respect_case', fuzzy=true, override_file_sorter=true, override_generic_sorter=true},
      project={base_dirs={'~/code', {'~/.config/dotfiles'}, {'~/.config/nvim'}}, hidden_files=false, theme='dropdown'}
    },
    file_ignore_patterns={'node_modules', 'venv'},
    file_previewer=previewers.vim_buffer_cat.new,
    file_sorter=sorters.get_fuzzy_file,
    generic_sorter=sorters.get_generic_fuzzy_sorter,
    grep_previewer=previewers.vim_buffer_vimgrep.new,
    initial_mode='normal',
    layout_config={
      height=0.60,
      horizontal={preview_width=0.60, prompt_position='top', results_width=0.60},
      preview_cutoff=160,
      vertical={mirror=false},
      width=0.60
    },
    show_line=true,
    borderchars={
      prompt={'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙'},
      results={'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙'},
      preview={'▀', '▐', '▄', '▌', '▛', '▜', '▟', '▙'}
    },
    layout_strategy='horizontal',
    mappings={
      n={
        ['<C-j>']=actions.move_selection_next,
        ['<C-k>']=actions.move_selection_previous,
        ['<C-n>']=actions.cycle_history_next,
        ['<C-p>']=actions.cycle_history_prev,
        ['<CR>']=actions.select_default,
        ['<Down>']=actions.move_selection_next,
        ['<S-TAB>']=actions.move_selection_previous,
        ['<TAB>']=actions.move_selection_next,
        ['<Up>']=actions.move_selection_previous
      },
      i={
        ['<C-j>']=actions.move_selection_next,
        ['<C-k>']=actions.move_selection_previous,
        ['<C-n>']=actions.cycle_history_next,
        ['<C-p>']=actions.cycle_history_prev,
        ['<CR>']=actions.select_default,
        ['<Down>']=actions.move_selection_next,
        ['<S-TAB>']=actions.move_selection_previous,
        ['<TAB>']=actions.move_selection_next,
        ['<Up>']=actions.move_selection_previous
      }
    },
    path_display={'truncate'},
    prompt_prefix='ᐳ ',
    qflist_previewer=previewers.vim_buffer_qflist.new,
    selection_caret='ᐳ ',
    selection_strategy='reset',
    set_env={['COLORTERM']='truecolor'},
    sorting_strategy='ascending'
  },
  pickers={find_files={find_command={'fd', '--type', 'f', '--strip-cwd-prefix'}}}
}
for _, x in pairs {'fzf', 'notify', 'project', 'terraform_doc'} do telescope.load_extension(x) end

-- Add leader shortcuts
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', function() require('telescope.builtin').find_files {previewer=false} end)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function() require('telescope.builtin').tags {only_current_buffer=true} end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)

return M
