require('nvim-treesitter.configs').setup({
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
  refactor={highlight_definitions={enable=true}},
  context_commentstring={enable_autocmd=false, enable=true}
})
