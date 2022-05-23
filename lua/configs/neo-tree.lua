local M = {}
local neotree_ok, neotree = pcall(require, 'neo-tree')
if not neotree_ok then return end
vim.g.neo_tree_legacy_commands = 1
neotree.setup {
  buffers={show_unloaded=true, window={mappings={['bd']='buffer_delete'}}},
  close_if_last_window=true,
  default_component_configs={
    icon={default='', folder_closed='>', folder_open='⋁'},
    indent={
      expander_highlight='NeoTreeExpander',
      highlight='NeoTreeIndentMarker',
      indent_marker='│',
      indent_size=2,
      last_indent_marker='└',
      with_markers=true
    },
    name={trailing_slash=true, use_git_status_colors=true}
  },
  enable_git_status=false,
   event_handlers = {
    {
      event = "file_open_requested",
      handler = function(args)
        local state = args.state
        local path = args.path
        local open_cmd = args.open_cmd or "edit"

        -- use last window if possible
        local suitable_window_found = false
        local nt = require("neo-tree")
        if nt.config.open_files_in_last_window then
          local prior_window = nt.get_prior_window()
          if prior_window > 0 then
            local success = pcall(vim.api.nvim_set_current_win, prior_window)
            if success then
              suitable_window_found = true
            end
          end
        end

        -- find a suitable window to open the file in
        if not suitable_window_found then
          if state.window.position == "right" then
            vim.cmd("wincmd t")
          else
            vim.cmd("wincmd w")
          end
        end
        local attempts = 0
        while attempts < 4 and vim.bo.filetype == "neo-tree" do
          attempts = attempts + 1
          vim.cmd("wincmd w")
        end
        if vim.bo.filetype == "neo-tree" then
          -- Neo-tree must be the only window, restore it's status as a sidebar
          local winid = vim.api.nvim_get_current_win()
          local width = require("neo-tree.utils").get_value(state, "window.width", 40)
          vim.cmd("vsplit " .. path)
          vim.api.nvim_win_set_width(winid, width)
        else
          vim.cmd(open_cmd .. " " .. path)
        end

        -- If you don't return this, it will proceed to open the file using built-in logic.
        return { handled = true }
      end
    },
  },
  filesystem={
    filtered_items={
      hide_by_name={'.DS_Store', 'node_modules', '__pycache__'},
      hide_dotfiles=false,
      hide_gitignored=true,
      visible=false
    },
    follow_current_file=true,
    hijack_netrw_behavior='open_current',
    use_libuv_file_watcher=false
  },
  nesting_rules={},
  window={
    position='left',
    width=30,
    mappings={
      ['<tab>'] = function (state)
        local node = state.tree:get_node()
        if require("neo-tree.utils").is_expandable(node) then
          state.commands["toggle_node"](state)
        else
          state.commands['open'](state)
          vim.cmd('Neotree reveal')                  
          -- vim.cmd('Neotree float toggle reveal_force_cwd dir=' .. vim.fn.getcwd()) -- I use this one.
        end
      end,
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
  }
}
return M
