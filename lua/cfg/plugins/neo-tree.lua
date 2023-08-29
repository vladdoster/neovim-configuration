local ok, neotree = pcall(require, 'neo-tree')
if not ok then
  return
end
neotree.setup{
  close_if_last_window=true,
  enable_diagnostics=false,
  enable_git_status=true,
  popup_border_style='rounded',
  sort_case_insensitive=false,
  sort_function=function(a, b)
    if a.type == b.type then
      return b.path > a.path
    else
      return b.type > a.type
    end
  end,
  default_component_configs={
    container={enable_character_fade=true},
    indent={
      indent_size=2,
      padding=1,
      with_markers=true,
      indent_marker='│',
      last_indent_marker='└',
      highlight='NeoTreeIndentMarker',
      with_expanders=nil,
      expander_collapsed='',
      expander_expanded='',
      expander_highlight='NeoTreeExpander'
    },
    icon={folder_closed='', folder_open='', folder_empty='ﰊ', default='*', highlight='NeoTreeFileIcon'},
    modified={symbol='[+]', highlight='NeoTreeModified'},
    name={trailing_slash=false, use_git_status_colors=true, highlight='NeoTreeFileName'},
    git_status={
      symbols={
        added='',
        modified='',
        deleted='-',
        renamed='~',
        untracked='',
        ignored='',
        unstaged='',
        staged='',
        conflict=''
      }
    }
  },
  window={
    position='left',
    width=40,
    mapping_options={noremap=true, nowait=true},
    mappings={
      ['<space>']={
        'toggle_node',
        nowait=false -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ['<']='prev_source',
      ['<2-LeftMouse>']='open',
      ['<cr>']='open',
      ['<esc>']='revert_preview',
      ['>']='next_source',
      ['?']='show_help',
      ['A']='add_directory', -- also accepts the optional config.show_path option like "add".
      ['C']='close_node',
      ['P']={'toggle_preview', config={use_float=true}},
      ['R']='refresh',
      ['S']='open_split',
      ['Z']='expand_all_nodes',

      ['a']={'add', config={show_path='none'}},
      ['c']='copy', -- takes text input for destination, also accepts the optional config.show_path option like "add":
      ['d']='delete',
      ['m']='move', -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ['p']='paste_from_clipboard',
      ['q']='close_window',
      ['r']='rename',
      ['s']='open_vsplit',
      ['t']='open_tabnew',
      ['w']='open_with_window_picker',
      ['x']='cut_to_clipboard',
      ['y']='copy_to_clipboard',
      ['z']='close_all_nodes'
      -- ["<cr>"] = "open_drop",
      -- ["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
      -- ["S"] = "split_with_window_picker",
      -- ["Z"] = "expand_all_nodes",
      -- ["s"] = "vsplit_with_window_picker",
      -- ["t"] = "open_tab_drop",
    }
  },
  nesting_rules={},
  filesystem={
    filtered_items={
      always_show={},
      hide_by_name={'node_modules'},
      hide_by_pattern={},
      hide_dotfiles=false,
      hide_gitignored=true,
      never_show={'.DS_Store', 'thumbs.db'},
      never_show_by_pattern={},
      visible=false
    },
    follow_current_file=true,
    hijack_netrw_behavior='open_current',
    use_libuv_file_watcher=true,
    -- follow_current_file=true,
    -- group_empty_dirs=false,
    -- hijack_netrw_behavior='open_default',
    -- use_libuv_file_watcher=false,
    window={
      mappings={
        ['.']='set_root',
        ['/']='fuzzy_finder',
        ['<bs>']='navigate_up',
        ['<c-x>']='clear_filter',
        ['D']='fuzzy_finder_directory',
        ['H']='toggle_hidden',
        ['[g']='prev_git_modified',
        [']g']='next_git_modified',
        ['f']='filter_on_submit',
        ['o']='system_open',
        ['P']={'toggle_preview', config={use_float=true}}

      }
    },
    commands={
      system_open=function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        vim.api.nvim_command('silent !open -g ' .. path)
        -- vim.api.nvim_command(string.format('silent !xdg-open \'%s\'', path))
      end
    }
  },
  buffers={
    follow_current_file=true, -- This will find and focus the file in the active buffer every
    group_empty_dirs=true, -- when true, empty folders will be grouped together
    show_unloaded=true,
    window={mappings={['bd']='buffer_delete', ['<bs>']='navigate_up', ['.']='set_root'}}
  },
  git_status={
    window={
      position='float',
      mappings={
        ['A']='git_add_all',
        ['gu']='git_unstage_file',
        ['ga']='git_add_file',
        ['gr']='git_revert_file',
        ['gc']='git_commit',
        ['gp']='git_push',
        ['gg']='git_commit_and_push'
      }
    }
  }
}
require('neo-tree.ui.inputs').confirm = function(message, callback)
  callback(vim.fn.confirm(message, '&Yes\n&No') == 1)
end
require('neo-tree.ui.inputs').input = function(message, default_value, callback, options, completion)
  local input
  if completion then
    input = vim.fn.input(message .. ' ', default_value or '', completion)
  else
    input = vim.fn.input(message .. ' ', default_value or '')
  end
  callback(input)
end

local k = vim.keymap.set
local c = function(str)
  return string.format([[<cmd>%s<cr>]], str)
end
k('n', '<leader>o', function()
  if vim.bo.filetype == 'neo-tree' then
    vim.cmd.wincmd'p'
  else
    vim.cmd.Neotree'focus'
  end
end)
k('n', '<leader>n', c('Neotree toggle left'))
k('n', '<leader>gd', c(':Neotree float reveal_file=<cfile> reveal_force_cwd'))
k('n', '<leader>b', c(':Neotree toggle show buffers right'))
k('n', '<leader>s', c(':Neotree float git_status'))

local function map(mode, lhs, rhs, opts)
  local options = {noremap=true, silent=true}
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- NvimTree
map('n', '<C-n>', ':Neotree toggle left<CR>') -- open/close
-- map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
-- map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file
