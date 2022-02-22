local M = {}
function M.config()
  local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
  if not ok then return end
  local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
  parser_configs.norg = {
    install_info = {
      url = 'https://github.com/nvim-neorg/tree-sitter-norg',
      files = {'src/parser.c', 'src/scanner.cc'},
      branch = 'main'
    }
  }
  treesitter.setup{
    ensure_installed = 'maintained',
    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm'
      }
    },
    indent = {enable = true},
    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false -- Whether the query persists across vim sessions
    },
    rainbow = {enable = true, extended_mode = true},
    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = { -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner'
        }
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {[']m'] = '@function.outer', [']]'] = '@class.outer'},
        goto_next_end = {[']M'] = '@function.outer', [']['] = '@class.outer'},
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer'
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer'
        }
      },
      swap = {
        enable = true,
        swap_next = {['<Leader>rx'] = '@parameter.inner'},
        swap_previous = {['<Leader>rX'] = '@parameter.inner'}
      },
      lsp_interop = {
        enable = true,
        border = 'none',
        peek_definition_code = {
          ['df'] = '@function.outer',
          ['dF'] = '@class.outer'
        }
      },
      refactor = {
        highlight_definitions = {enable = true},
        highlight_current_scope = {enable = true},
        smart_rename = {enable = true, keymaps = {smart_rename = 'grr'}},
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = 'gnd',
            list_definitions = 'gnD',
            list_definitions_toc = 'gO',
            goto_next_usage = '<a-*>',
            goto_previous_usage = '<a-#>'
          }
        }
      }
    },
    context_commentstring = {enable = true, enable_autocmd = false},
    textsubjects = {
      enable = true,
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer'
      }
    },
    matchup = {enable = true}
  }
end
return M
