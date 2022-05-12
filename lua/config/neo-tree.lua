require('neo-tree').setup {
  close_if_last_window = true,
  popup_border_style = 'rounded',
  enable_git_status = false,
  enable_diagnostics = false,
  default_component_configs = {
    container = { enable_character_fade = true },
    git_status = {
      symbols = {
        added = '',
        conflict = '',
        deleted = '',
        ignored = '',
        modified = '',
        renamed = '',
        staged = '',
        unstaged = '',
        untracked = '',
      },
    },
    icon = { folder_closed = '', folder_open = '', folder_empty = 'ﰊ', default = '*', highlight = 'NeoTreeFileIcon' },
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
      with_expanders = nil,
      expander_collapsed = '>',
      expander_expanded = 'V',
      expander_highlight = 'NeoTreeExpander',
    },
    modified = { symbol = '[+]', highlight = 'NeoTreeModified' },
    name = { trailing_slash = false, use_git_status_colors = true, highlight = 'NeoTreeFileName' },
  },
  window = {
    mapping_options = { noremap = true, nowait = true },
    mappings = {
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      ['<2-LeftMouse>'] = 'open',
      ['<cr>'] = 'open',
      ['<space>'] = { 'toggle_node', nowait = false },
      ['?'] = 'show_help',
      ['A'] = 'add_directory',
      ['C'] = 'close_node',
      ['R'] = 'refresh',
      ['S'] = 'open_split',
      ['a'] = { 'add', config = { show_path = 'none' } },
      ['c'] = 'copy',
      ['d'] = 'delete',
      ['m'] = 'move',
      ['p'] = 'paste_from_clipboard',
      ['q'] = 'close_window',
      ['r'] = 'rename',
      ['s'] = 'open_vsplit',
      ['t'] = 'open_tabnew',
      ['w'] = 'open_with_window_picker',
      ['x'] = 'cut_to_clipboard',
      ['y'] = 'copy_to_clipboard',
    },
    position = 'left',
    width = 40,
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      hide_dotfiles = true,
      hide_gitignored = true,
      hide_hidden = true,
      hide_by_name = { 'node_modules' },
      never_show = { '.DS_Store', 'thumbs.db' },
      visible = false,
    },
    follow_current_file = true, -- This will find and focus the file in the active buffer every
    group_empty_dirs = false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = 'open_default',
    use_libuv_file_watcher = false,
    window = {
      mappings = {
        ['-'] = 'navigate_up',
        ['.'] = 'set_root',
        ['/'] = 'fuzzy_finder',
        ['<c-x>'] = 'clear_filter',
        ['H'] = 'toggle_hidden',
        ['f'] = 'filter_on_submit',
        ['<tab>'] = function(state)
          local node = state.tree:get_node()
          if require('neo-tree.utils').is_expandable(node) then
            state.commands['toggle_node'](state)
          else
            state.commands['open'](state)
            vim.cmd 'Neotree reveal'
          end
        end,
      },
      popup = {
        position = { col = '100%', row = '2' },
        size = function(state)
          local root_name = vim.fn.fnamemodify(state.path, ':~')
          local root_len = string.len(root_name) + 4
          return {
            width = math.max(root_len, 50),
            height = vim.o.lines - 6,
          }
        end,
      },
    },
  },
  buffers = {
    follow_current_file = true,
    group_empty_dirs = true,
    show_unloaded = true,
    window = {
      mappings = {
        ['.'] = 'set_root',
        ['<bs>'] = 'navigate_up',
        ['bd'] = 'buffer_delete',
      },
    },
  },
}

vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
