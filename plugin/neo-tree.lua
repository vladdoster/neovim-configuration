local ok, neotree = pcall(require, 'neo-tree')
if not ok then return end

neotree.setup {
  close_if_last_window=true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style='rounded',
  use_popups_for_input=false,
  enable_git_status=true,
  enable_diagnostics=true,
  use_default_mappings=false,
  default_component_configs={
    indent={
      indent_size=2,
      padding=1, -- extra padding on left hand side
      -- indent guides
      with_markers=true,
      indent_marker='│',
      last_indent_marker='└',
      highlight='NeoTreeIndentMarker',
      -- expander config, needed for nesting files
      with_expanders=nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed='',
      expander_expanded='',
      expander_highlight='NeoTreeExpander'
    },
    icon={folder_closed='', folder_open='', folder_empty='ﰊ', default='*'},
    modified={symbol='[+]', highlight='NeoTreeModified'},
    name={trailing_slash=true, use_git_status_colors=true},
    git_status={
      symbols={
        -- Change type
        added='', -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified='', -- or "", but this is redundant info if you use git_status_colors on the name
        deleted='✖', -- this can only be used in the git_status source
        renamed='', -- this can only be used in the git_status source
        -- Status type
        untracked='?',
        ignored='',
        unstaged='M',
        staged='',
        conflict=''
      }
    }
  },
  window={
    position='left',
    width=40,
    mappings={
      ['.']='',
      ['/']='',
      ['<C-v>']='vsplit_with_window_picker',
      ['<C-x>']='split_with_window_picker',
      ['<CR>']='open',
      ['<bs>']='navigate_up',
      ['<c-f>']='clear_filter',
      ['A']='',
      ['C']='set_root',
      ['H']='toggle_hidden',
      ['K']='navigate_up',
      ['S']='split',
      ['T']='open_tabnew',
      ['V']='vsplit',
      ['X']='close_node',
      ['[g']='',
      [']g']='',
      ['a']='',
      ['c']='copy_to_clipboard',
      ['d']='',
      ['f']='filter_on_submit',
      ['m']='',
      ['ma']='add',
      ['md']='delete',
      ['mm']='move',
      ['mr']='rename',
      ['o']='open_with_window_picker',
      ['p']='paste_from_clipboard',
      ['q']='close_window',
      ['r']='refresh',
      ['s']='',
      ['space']='',
      ['t']='open_tabnew',
      ['x']='cut_to_clipboard'
    },
    mapping_options={nowait=true}
  },
  nesting_rules={},
  filesystem={
    filtered_items={
      visible=true,
      hide_dotfiles=true,
      hide_gitignored=true,
      hide_by_name={'.DS_Store', 'thumbs.db'},
      never_show={'node_modules'}
    },
    follow_current_file=false, -- This will find and focus the file in the active buffer every
    hijack_netrw_behavior='open_default' -- netrw disabled, opening a directory opens neo-tree
  },
  buffers={show_unloaded=true, window={mappings={['bd']='buffer_delete'}}}
}

require('neo-tree.ui.inputs').confirm =
  function(message, callback) callback(vim.fn.confirm(message, '&Yes\n&No') == 1) end

require('neo-tree.ui.inputs').input = function(message, default_value, callback, options, completion)
  local input
  if completion then
    input = vim.fn.input(message .. ' ', default_value or '', completion)
  else
    input = vim.fn.input(message .. ' ', default_value or '')
  end
  callback(input)
end
