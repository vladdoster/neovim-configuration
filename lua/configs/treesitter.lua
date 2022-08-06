if vim.api.nvim_list_uis() == 0 then return end

local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end
treesitter.setup {
  ensure_installed={'bash', 'dockerfile', 'go', 'hcl', 'json', 'python', 'python', 'yaml'},
  ignore_install={'haskell', 'phpdoc'},
  highlight={enable=true},
  indent={enable=true, disable={'python', 'yaml'}},
  incremental_selection={
    enable=true,
    keymaps={
      init_selection='<S-Tab>', -- normal mode
      node_incremental='<Tab>', -- visual mode
      node_decremental='<S-Tab>' -- visual mode
    }
  },
  autotag={enable=true, filetypes={'markdown'}},
  rainbow={enable=true},
  matchup={enable=true}
}
