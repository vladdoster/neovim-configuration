local M = {}
local neotree_ok, neotree = pcall(require, 'neo-tree')
if not neotree_ok then return end
vim.g.neo_tree_legacy_commands = 1
neotree.setup {
  close_if_last_window=true,
  popup_border_style='rounded',
  enable_git_status=true,
  enable_diagnostics=true,
  default_component_configs={
    indent={
      expander_collapsed='>',
      expander_expanded='',
      expander_highlight='NeoTreeExpander',
      highlight='NeoTreeIndentMarker',
      indent_marker='│',
      indent_size=2,
      last_indent_marker='└',
      padding=1, -- extra padding on left hand side
      with_expanders=nil, -- if nil and file nesting is enabled, will enable expanders
      with_markers=true
    },
    icon={default='', folder_closed='', folder_empty='', folder_open=''},
    modified={symbol='', highlight='NeoTreeModified'},
    name={trailing_slash=true, use_git_status_colors=true},
    git_status={
      symbols={
        added='',
        conflict='',
        deleted='',
        ignored='◌',
        modified='',
        renamed='➜',
        staged='+',
        unstaged='ϟ',
        untracked='?'
      }
    }
  },
  window={
    position='left',
    width=30,
    mappings={
      ['-']='navigate_up',
      ['.']='set_root',
      ['/']='fuzzy_finder',
      ['<2-LeftMouse>']='open',
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
  },
  nesting_rules={},
  filesystem={
    window={
      mappings={
        ['H']='toggle_hidden',
        ['/']='fuzzy_finder',
        ['f']='filter_on_submit',
        ['<C-l>']='clear_filter',
        ['<Bs>']='navigate_up',
        ['.']='set_root',
        ['<C-x>']='open_split'
      }
    },
    filtered_items={
      visible=false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles=true,
      hide_gitignored=true,
      hide_by_name={'.DS_Store', 'thumbs.db', 'node_modules'}
    },
    follow_current_file=true, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    hijack_netrw_behavior='open_default', -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher=true -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
  },
  buffers={show_unloaded=true, window={mappings={['bd']='buffer_delete'}}},
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
  },
  event_handlers={
    {
      event='neo_tree_buffer_enter',
      handler=function()
        vim.wo.signcolumn = 'no'
        -- vim.cmd [[map <C-x> :echo "c-x"<Cr>]]
      end
    }
  }
}

for hi, c in pairs {
  NeoTreeGitAdded='lightgreen',
  NeoTreeGitConflict='magenta',
  NeoTreeGitDeleted='lightred',
  NeoTreeGitModified='yellow',
  NeoTreeGitUntracked='cyan'
} do vim.cmd(('highlight %s guifg=%s'):format(hi, c)) end

return M
