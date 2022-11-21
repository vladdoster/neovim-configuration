local ok, neotree = pcall(require, 'neo-tree')
if not ok then return end

neotree.setup {
  close_if_last_window=false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style='rounded',
  enable_git_status=true,
  enable_diagnostics=false,
  sort_case_insensitive=false, -- used when sorting files and directories in the tree
  sort_function=nil, -- use a custom function for sorting files and directories in the tree
  -- sort_function = function (a,b)
  --       if a.type == b.type then
  --           return a.path > b.path
  --       else
  --           return a.type > b.type
  --       end
  --   end , -- this sorts files and directories descendantly
  default_component_configs={
    container={enable_character_fade=true},
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
    icon={
      folder_closed='',
      folder_open='',
      folder_empty='ﰊ',
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default='*',
      highlight='NeoTreeFileIcon'
    },
    modified={symbol='[+]', highlight='NeoTreeModified'},
    name={trailing_slash=false, use_git_status_colors=true, highlight='NeoTreeFileName'},
    git_status={
      symbols={
        -- Change type
        added='', -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified='', -- or "", but this is redundant info if you use git_status_colors on the name
        deleted='✖', -- this can only be used in the git_status source
        renamed='', -- this can only be used in the git_status source
        -- Status type
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
      visible=false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles=true,
      hide_gitignored=true,
      hide_by_name={'node_modules'},
      hide_by_pattern={ -- uses glob style patterns
        -- "*.meta",
        -- "*/src/*/tsconfig.json",
      },
      always_show={ -- remains visible even if other settings would normally hide it
        -- ".gitignored",
      },
      never_show={ -- remains hidden even if visible is toggled to true, this overrides always_show
        '.DS_Store',
        'thumbs.db'
      },
      never_show_by_pattern={ -- uses glob style patterns
        -- ".null-ls_*",
      }
    },
    follow_current_file=false, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs=false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior='open_default', -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher=false, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
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
        ['o']='system_open'
      }
    },
    commands={
      system_open=function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        -- macOS
        vim.api.nvim_command('silent !open -g ' .. path)
        -- Linux
        -- vim.api.nvim_command(string.format('silent !xdg-open \'%s\'', path))
      end
    }
  },
  buffers={
    follow_current_file=true, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
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
