local ok, actions = pcall(require, 'telescope.actions')
if not ok then return end
local previewers = require 'telescope.previewers'
local sorters = require 'telescope.sorters'
local config = {
    defaults={
        prompt_prefix=' ',
        selection_caret=' ',
        entry_prefix='  ',
        initial_mode='insert',
        selection_strategy='reset',
        sorting_strategy='descending',
        layout_strategy='horizontal',
        layout_config={
            width=0.75,
            preview_cutoff=120,
            horizontal={mirror=false},
            vertical={mirror=false}
        },
        vimgrep_arguments={
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--glob=!.git/'
        },
        mappings={
            i={
                ['<C-n>']=actions.move_selection_next,
                ['<C-p>']=actions.move_selection_previous,
                ['<C-c>']=actions.close,
                ['<C-j>']=actions.cycle_history_next,
                ['<C-k>']=actions.cycle_history_prev,
                ['<C-q>']=actions.smart_send_to_qflist + actions.open_qflist,
                ['<CR>']=actions.select_default + actions.center
            },
            n={
                ['<C-n>']=actions.move_selection_next,
                ['<C-p>']=actions.move_selection_previous,
                ['<C-q>']=actions.smart_send_to_qflist + actions.open_qflist
            }
        },
        file_ignore_patterns={},
        path_display={shorten=5},
        winblend=0,
        border={},
        borderchars={'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons=true,
        set_env={['COLORTERM']='truecolor'}, -- default = nil,
        pickers={
            find_files={find_command={'fd', '--type=file', '--hidden', '--smart-case'}},
            live_grep={
                -- @usage don't include the filename in the search results
                only_sort_text=true
            }
        }
    },
    extensions={
        fzf={
            fuzzy=true, -- false will only do exact matching
            override_generic_sorter=true, -- override the generic sorter
            override_file_sorter=true, -- override the file sorter
            case_mode='smart_case' -- or "ignore_case" or "respect_case"
        }
    },
    file_previewer=previewers.vim_buffer_cat.new,
    grep_previewer=previewers.vim_buffer_vimgrep.new,
    qflist_previewer=previewers.vim_buffer_qflist.new,
    file_sorter=sorters.get_fuzzy_file,
    generic_sorter=sorters.get_generic_fuzzy_sorter
}
-- Define this minimal config so that it's available if telescope is not yet available.
local opts = {
    winblend=15,
    layout_config={prompt_position='top', width=80, height=12},
    borderchars={
        prompt={'─', '│', ' ', '│', '╭', '╮', '│', '│'},
        results={'─', '│', '─', '│', '├', '┤', '╯', '╰'},
        preview={'─', '│', '─', '│', '╭', '╮', '╯', '╰'}
    },
    border={},
    previewer=false,
    shorten_path=false
}
local builtin = require 'telescope.builtin'
local themes = require 'telescope.themes'
builtin.lsp_code_actions(themes.get_dropdown(opts))
local telescope = require 'telescope'
telescope.setup(config)
require('telescope').load_extension 'fzf'
