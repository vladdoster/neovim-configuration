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
    file_sorter=require('telescope.sorters').get_fzy_sorter,
    generic_sorter=require('telescope.sorters').get_generic_fuzzy_sorter,
    file_previewer=require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer=require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer=require('telescope.previewers').vim_buffer_qflist.new,
    prompt_prefix='  ',
    selection_caret='  ',
    selection_strategy='reset',
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
    sorting_strategy='ascending',
    layout_strategy='flex',
    -- layout_config={
    --   flex={flip_columns=161},
    --   horizontal={preview_cutoff=0, preview_width=0.6},
    --   vertical={preview_cutoff=0, preview_height=0.75}
    -- },
    color_devicons=true,
    winblend=5,
    set_env={['COLORTERM']='truecolor'},
    border={},
    borderchars={' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '},
    mappings={
      i={
        ['<C-w>']=function() vim.api.nvim_input '<c-s-w>' end,
        ['<Tab>']=actions.move_selection_next,
        ['<S-Tab>']=actions.move_selection_previous,
        ['<C-p>']=actions.cycle_history_prev,
        ['<C-n>']=actions.cycle_history_next,
        ['<C-l>']=layout_actions.toggle_preview,
        ['<C-q>']=actions.smart_send_to_qflist + actions.open_qflist,
        ['<Esc>']=actions.close,
        ['<C-j>']=actions.toggle_selection + actions.move_selection_next,
        ['<C-k>']=actions.toggle_selection + actions.move_selection_previous
      }
    }
  },
  extensions={
    fzf={fuzzy=true, override_generic_sorter=true, override_file_sorter=true, case_mode='smart_case'},
    project={base_dirs={'~/.config/dotfiles/', '~/.config/nvim/', {path='~/code/', max_depth=2}}, hidden_files=true},
    recent_files={},
    repo = { list = { fd_opts = { "--no-ignore-vcs", }, search_dirs = { "~/code", '~/.local/share/' }}}
  }
}

extensions = {'fzf' ,'make' ,'project' ,'recent_files' ,'repo'}
for _, ext in pairs(extensions) do telescope.load_extension(ext) end
