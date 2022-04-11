local M = {}
local status_ok, neotree = pcall(require, 'neo-tree')
if not status_ok then
  return
end
vim.g.neo_tree_legacy_commands = 1
neotree.setup {
  buffers = {
    show_unloaded = true,
    window = { mappings = { ['bd'] = 'buffer_delete' } },
  },
  close_if_last_window = true,
  default_component_configs = {
    git_status = {
      symbols = {
        added = '',
        deleted = '',
        modified = '',
        renamed = '➜',
        untracked = '★',
        ignored = '◌',
        unstaged = '✗',
        staged = '✓',
        conflict = '',
      },
    },
    icon = {
      folder_closed = '',
      folder_open = '',
      folder_empty = '',
      default = '',
    },
    indent = {
      indent_size = 2,
      padding = 0,
      with_markers = true,
      indent_marker = '│',
      last_indent_marker = '└',
      highlight = 'NeoTreeIndentMarker',
      with_expanders = false,
      expander_collapsed = '',
      expander_expanded = '',
      expander_highlight = 'NeoTreeExpander',
    },
    name = { trailing_slash = false, use_git_status_colors = true },
  },
  enable_diagnostics = false,
  enable_git_status = true,
  event_handlers = {
    {
      event = 'vim_buffer_enter',
      handler = function(_)
        if vim.bo.filetype == 'neo-tree' then
          vim.wo.signcolumn = 'auto'
        end
      end,
    },
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = true,
      hide_gitignored = false,
      hide_by_name = {
        '.DS_Store',
        'thumbs.db',
        'node_modules',
        '__pycache__',
      },
    },
    follow_current_file = true,
    hijack_netrw_behavior = 'open_current',
    use_libuv_file_watcher = true,
  },
  git_status = {
    window = {
      position = 'float',
      mappings = {
        ['A'] = 'git_add_all',
        ['gu'] = 'git_unstage_file',
        ['ga'] = 'git_add_file',
        ['gr'] = 'git_revert_file',
        ['gc'] = 'git_commit',
        ['gp'] = 'git_push',
        ['gg'] = 'git_commit_and_push',
      },
    },
  },
  nesting_rules = {},
  popup_border_style = 'rounded',
  window = {
    position = 'left',
    width = 25,
    mappings = {
      ['.'] = 'set_root',
      ['/'] = 'fuzzy_finder',
      ['<2-LeftMouse>'] = 'open',
      ['<bs>'] = 'navigate_up',
      ['<c-x>'] = 'clear_filter',
      ['<cr>'] = 'open',
      ['C'] = 'close_node',
      ['H'] = 'toggle_hidden',
      ['R'] = 'refresh',
      ['S'] = 'open_split',
      ['a'] = 'add',
      ['c'] = 'copy',
      ['d'] = 'delete',
      ['f'] = 'filter_on_submit',
      ['m'] = 'move',
      ['o'] = 'open',
      ['p'] = 'paste_from_clipboard',
      ['q'] = 'close_window',
      ['r'] = 'rename',
      ['s'] = 'open_vsplit',
      ['x'] = 'cut_to_clipboard',
      ['y'] = 'copy_to_clipboard',
    },
  },
}
return M
