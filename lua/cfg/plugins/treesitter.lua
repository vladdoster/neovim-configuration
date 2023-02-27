-- Treesitter folds
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.o.foldlevelstart = 99
require('nvim-treesitter.configs').setup({
  -- nvim-treesitter/nvim-treesitter (self config)
  auto_install=true,
  ensure_installed={'bash', 'go', 'json', 'lua', 'markdown', 'markdown_inline'},
  highlight={enable=true, additional_vim_regex_highlighting=false},
  indent={enable=true},
  incremental_selection={
    enable=true,
    keymaps={init_selection='gs', node_incremental='gs', node_decremental='gS', scope_incremental='<leader>gc'}
  },
  -- nvim-treesitter/nvim-treesitter-textobjects
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
      swap_next={['<leader>a']='@parameter.inner', ['<leader>f']='@function.outer', ['<leader>e']='@element'},
      swap_previous={['<leader>A']='@parameter.inner', ['<leader>F']='@function.outer', ['<leader>E']='@element'}
    },
    move={
      enable=true,
      set_jumps=true, -- whether to set jumps in the jumplist
      goto_next_start={[']f']='@function.outer', [']]']='@class.outer'},
      goto_next_end={[']F']='@function.outer', ['][']='@class.outer'},
      goto_previous_start={['[f']='@function.outer', ['[[']='@class.outer'},
      goto_previous_end={['[F']='@function.outer', ['[]']='@class.outer'}
    }
  },
  -- windwp/nvim-ts-autotag
  autotag={enable=true},
  -- nvim-treesitter/playground
  playground={
    enable=true,
    disable={},
    updatetime=25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries=false -- Whether the query persists across vim sessions
  },
  -- nvim-treesitter/nvim-treesitter-refactor
  refactor={
    highlight_definitions={enable=true}
    -- highlight_current_scope = { enable = false },
  },
  context_commentstring={enable=true, enable_autocmd=false}
})
