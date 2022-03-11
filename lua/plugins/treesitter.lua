-- Treesitter folds
require('nvim-treesitter.configs').setup({
  ensure_installed={'dockerfile', 'hcl', 'bash', 'python', 'go', 'java'},
  highlight={enable=true, additional_vim_regex_highlighting=false},
  indent={enable=true},
  incremental_selection={
    enable=true,
    keymaps={
      init_selection='<leader>si',
      node_incremental='<leader>sn',
      node_decremental='<leader>sN',
      scope_incremental='<leader>sc'
    }
  },
  textobjects={
    select={
      enable=true,
      lookahead=true,
      keymaps={
        ['af']='@function.outer',
        ['if']='@function.inner',
        ['ac']='@class.outer',
        ['ic']='@class.inner',
        ['al']='@loop.outer',
        ['il']='@loop.inner',
        ['aa']='@parameter.outer',
        ['ia']='@parameter.inner',
        ['uc']='@comment.outer'
      }
    },
    swap={
      enable=true,
      swap_next={
        ['<leader>a']='@parameter.inner',
        ['<leader>f']='@function.outer',
        ['<leader>e']='@element'
      },
      swap_previous={
        ['<leader>A']='@parameter.inner',
        ['<leader>F']='@function.outer',
        ['<leader>E']='@element'
      }
    },
    move={
      enable=true,
      set_jumps=true,
      goto_next_start={[']f']='@function.outer', [']]']='@class.outer'},
      goto_next_end={[']F']='@function.outer', ['][']='@class.outer'},
      goto_previous_start={['[f']='@function.outer', ['[[']='@class.outer'},
      goto_previous_end={['[F']='@function.outer', ['[]']='@class.outer'}
    }
  },
  autotag={enable=true},
  playground={
    enable=true,
    disable={},
    updatetime=25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries=false -- Whether the query persists across vim sessions
  },
  refactor={highlight_definitions={enable=true}, highlight_current_scope={enable=false}}
})
