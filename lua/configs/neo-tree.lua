local M = {}
local neotree_ok, neotree = pcall(require, 'neo-tree')
if not neotree_ok then return end
vim.g.neo_tree_legacy_commands = 1
neotree.setup {
  buffers={show_unloaded=true, window={mappings={['bd']='buffer_delete'}}},
  close_if_last_window=true,
  default_component_configs={
    git_status={
      symbols={
        added='⊞',
        conflict='',
        deleted='⊟',
        ignored='◌',
        modified='⧆',
        renamed='↔',
        staged='☑',
        unstaged='☐',
        untracked='☒'
      }
    },
    icon={default='', folder_closed='', folder_empty='', folder_open=''},
    indent={
      expander_collapsed='>',
      expander_expanded='',
      expander_highlight='NeoTreeExpander',
      highlight='NeoTreeIndentMarker',
      indent_marker='│',
      indent_size=2,
      last_indent_marker='└',
      padding=0,
      with_expanders=false,
      with_markers=true
    },
    name={trailing_slash=false, use_git_status_colors=true}
  },
  enable_diagnostics=false,
  enable_git_status=true,
  event_handlers={
    {
      event='vim_buffer_enter',
      handler=function(_) if vim.bo.filetype == 'neo-tree' then vim.wo.signcolumn = 'auto' end end
    }
  },
  filesystem={
    filtered_items={
      hide_by_name={'.DS_Store', 'node_modules', '__pycache__'},
      hide_dotfiles=true,
      hide_gitignored=false,
      visible=false
    },
    follow_current_file=true,
    hijack_netrw_behavior='open_current',
    use_libuv_file_watcher=true
  },
  git_status={
    window={
      position='float',
      mappings={
        ['A']='git_add_all',
        ['ga']='git_add_file',
        ['gc']='git_commit',
        ['gg']='git_commit_and_push',
        ['gp']='git_push',
        ['gr']='git_revert_file',
        ['gu']='git_unstage_file'
      }
    }
  },
  nesting_rules={},
  window={
    position='left',
    width=25,
    mappings={
      ['.']='set_root',
      ['/']='fuzzy_finder',
      ['<2-LeftMouse>']='open',
      ['-']='navigate_up',
      ['<c-x>']='clear_filter',
      ['<cr>']='open',
      ['C']='close_node',
      ['H']='toggle_hidden',
      ['R']='refresh',
      ['S']='open_split',
      ['a']='add',
      ['c']='copy',
      ['d']='delete',
      ['f']='filter_on_submit',
      ['m']='move',
      ['o']='open',
      ['p']='paste_from_clipboard',
      ['q']='close_window',
      ['r']='rename',
      ['s']='open_vsplit',
      ['x']='cut_to_clipboard',
      ['y']='copy_to_clipboard'
    }
  }
}
return M
