require('neo-tree').setup {
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = 'rounded',
  enable_git_status = false,
  enable_diagnostics = false,
  default_component_configs = {
    container = {
      enable_character_fade = true,
    },
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = '>',
      expander_expanded = 'V',
      expander_highlight = 'NeoTreeExpander',
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = 'ﰊ',
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = '*',
      highlight = 'NeoTreeFileIcon',
    },
    modified = {
      symbol = '[+]',
      highlight = 'NeoTreeModified',
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = 'NeoTreeFileName',
    },
    git_status = {
      symbols = {
        added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
        conflict = '',
        deleted = '', -- this can only be used in the git_status source
        ignored = '',
        modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
        renamed = '', -- this can only be used in the git_status source
        staged = '',
        unstaged = '',
        untracked = '',
      },
    },
  },
  window = {
    position = 'left',
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ['<space>'] = {
        'toggle_node',
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ['<2-LeftMouse>'] = 'open',
      ['<cr>'] = 'open',
      ['S'] = 'open_split',
      ['s'] = 'open_vsplit',
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      ['t'] = 'open_tabnew',
      ['w'] = 'open_with_window_picker',
      ['C'] = 'close_node',
      ['a'] = {
        'add',
        config = {
          show_path = 'none', -- "none", "relative", "absolute"
        },
      },
      ['A'] = 'add_directory', -- also accepts the config.show_path option.
      ['d'] = 'delete',
      ['r'] = 'rename',
      ['y'] = 'copy_to_clipboard',
      ['x'] = 'cut_to_clipboard',
      ['p'] = 'paste_from_clipboard',
      ['c'] = 'copy', -- takes text input for destination
      ['m'] = 'move', -- takes text input for destination
      ['q'] = 'close_window',
      ['R'] = 'refresh',
      ['?'] = 'show_help',
    },
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        'node_modules',
      },
      never_show = { -- remains hidden even if visible is toggled to true
        '.DS_Store',
        'thumbs.db',
      },
    },
    follow_current_file = false, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = 'open_default', -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
    window = {
      mappings = {
        ['-'] = 'navigate_up',
        ['.'] = 'set_root',
        ['/'] = 'fuzzy_finder',
        ['<c-x>'] = 'clear_filter',
        ['H'] = 'toggle_hidden',
        ['[g'] = 'prev_git_modified',
        [']g'] = 'next_git_modified',
        ['f'] = 'filter_on_submit',
      },
    },
  },
  buffers = {
    follow_current_file = true, -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = true, -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      mappings = {
        ['bd'] = 'buffer_delete',
        ['<bs>'] = 'navigate_up',
        ['.'] = 'set_root',
      },
    },
  },
}

vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
