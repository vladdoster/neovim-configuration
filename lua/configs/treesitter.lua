if vim.api.nvim_list_uis() == 0 then return end

local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end
treesitter.setup {
  ensure_installed={'bash', 'go', 'hcl', 'java', 'json', 'python', 'python', 'yaml'},
  ignore_install={'haskell', 'phpdoc'},
  highlight={enable=true},
  indent={enable=true, disable={'python', 'yaml'}},
  playground={
    enable=true,
    disable={},
    updatetime=25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries=false -- Whether the query persists across vim sessions
  },
  incremental_selection={
    enable=true,
    keymaps={
      init_selection='<S-Tab>', -- normal mode
      node_incremental='<Tab>', -- visual mode
      node_decremental='<S-Tab>' -- visual mode
    }
  },
  -- extensions
  textobjects={select={enable=true, keymaps={['af']='@function.outer', ['if']='@function.inner'}}},
  autotag={enable=true, filetypes={'html', 'javascript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue'}},
  rainbow={enable=true},
  context_commentstring={enable=true, config={javascriptreact={style_element='{/*%s*/}'}}},
  matchup={enable=true}
}
