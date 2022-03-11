local A, K = vim.api, require('keymap')
local actions = require('telescope.actions')
require('telescope').setup({
  defaults={
    prompt_prefix='ᐳ ',
    initial_mode='insert',
    sorting_strategy='ascending',
    layout_config={prompt_position='top'},
    mappings={
      i={
        ['<ESC>']=actions.close,
        ['<C-j>']=actions.move_selection_next,
        ['<C-k>']=actions.move_selection_previous,
        ['<TAB>']=actions.toggle_selection + actions.move_selection_next,
        ['<C-s>']=actions.send_selected_to_qflist,
        ['<C-q>']=actions.send_to_qflist
      }
    }
  },
  extensions={
    fzf={
      fuzzy=true,
      override_generic_sorter=true,
      override_file_sorter=true,
      case_mode='smart_case'
    }
  }
})
_G.Telescope = setmetatable({}, {
  __index=function(_, k)
    if vim.bo.filetype == 'NvimTree' then A.nvim_command('wincmd l') end
    return require('telescope.builtin')[k]
  end
})

K.n('<C-P>', '<CMD>lua Telescope.find_files({ hidden = true })<CR>')
K.n('<leader>H', '<CMD>lua Telescope.help_tags()<CR>')
K.n('\'b', '<CMD>lua Telescope.buffers()<CR>')
K.n('\'r', '<CMD>lua Telescope.live_grep()<CR>')
K.n('\'c', '<CMD>lua Telescope.git_status()<CR>')
