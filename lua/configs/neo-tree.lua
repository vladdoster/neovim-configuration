local neotree_ok, neotree = pcall(require, 'neo-tree')
if not neotree_ok then return end

vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
neotree.setup({
  close_if_last_window=true,
  popup_border_style='rounded',
  enable_git_status=false,
  enable_diagnostics=false,
  sort_case_insensitive=false, -- used when sorting files and directories in the tree
  -- sort_function=nil, -- use a custom function for sorting files and directories in the tree
  sort_function=function(a, b)
    if a.type == b.type then
      return a.path > b.path
    else
      return a.type > b.type
    end
  end, -- this sorts files and directories descendantly
  default_component_configs={
    container={enable_character_fade=true},
    indent={
      expander_collapsed='',
      expander_expanded='',
      expander_highlight='NeoTreeExpander',
      highlight='NeoTreeIndentMarker',
      indent_marker='│',
      indent_size=2,
      last_indent_marker='└',
      padding=1, -- extra padding on left hand side
      with_expanders=nil, -- if nil and file nesting is enabled, will enable expanders
      with_markers=true
    },
    icon={default='*', folder_closed='', folder_empty='ﰊ', folder_open='', highlight='NeoTreeFileIcon'},
    modified={symbol='[+]', highlight='NeoTreeModified'},
    name={trailing_slash=false, use_git_status_colors=true, highlight='NeoTreeFileName'},
    git_status={
      symbols={
        added='✚',
        conflict='',
        deleted='✖',
        ignored='',
        modified='',
        renamed='',
        staged='',
        unstaged='',
        untracked=''
      }
    }
  },
  window={
    position='left',
    width=40,
    mapping_options={noremap=true, nowait=true},
    mappings={
      -- ['S']='open_split',
      -- ['c']='copy', -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ['s']='open_vsplit',
      ['S']='split_with_window_picker',
      ['Z']='expand_all_nodes',
      ['c']={'copy', config={show_path='none'}},
      ['s']='vsplit_with_window_picker',
      ['<2-LeftMouse>']='open',
      ['<cr>']='open',
      ['<space>']={'toggle_node', nowait=false},
      ['?']='show_help',
      ['A']='add_directory',
      ['C']='close_node',
      ['R']='refresh',
      ['a']={'add', config={show_path='relative'}},
      ['d']='delete',
      ['m']='move',
      ['p']='paste_from_clipboard',
      ['q']='close_window',
      ['r']='rename',
      ['t']='open_tabnew',
      ['w']='open_with_window_picker',
      ['x']='cut_to_clipboard',
      ['y']='copy_to_clipboard',
      ['z']='close_all_nodes'
    }
  },
  nesting_rules={},
  filesystem={
    filtered_items={
      visible=false,
      hide_dotfiles=false,
      hide_gitignored=true,
      hide_hidden=false,
      hide_by_name={'node_modules', '.git'},
      never_show={'.DS_Store', 'thumbs.db'}
    },
    follow_current_file=true,
    group_empty_dirs=false,
    hijack_netrw_behavior='open_default',
    use_libuv_file_watcher=false,
    window={
      mappings={
        ['<bs>']='navigate_up',
        ['.']='set_root',
        ['H']='toggle_hidden',
        ['/']='fuzzy_finder',
        ['D']='fuzzy_finder_directory',
        ['f']='filter_on_submit',
        ['<c-x>']='clear_filter',
        ['[g']='prev_git_modified',
        [']g']='next_git_modified'
      }
    }
  },
  buffers={
    follow_current_file=true,
    group_empty_dirs=true,
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
})
