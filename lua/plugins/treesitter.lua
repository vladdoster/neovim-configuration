local present, ts_config = pcall(require, 'nvim-treesitter.configs')
if not present then return end
ts_config.setup {
    ensure_installed={'hcl', 'go', 'hcl', 'python', 'markdown' },
    indent={enable=true},
    highlight={enable=true, use_languagetree=true, additional_vim_regex_highlighting={'org'}},
    rainbow={
        enable=true,
        extended_mode=true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines=nil -- Do not enable for files with more than n lines, int
    },
    playground={
        enable=true,
        updatetime=25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries=false -- Whether the query persists across vim sessions
    },
    incremental_selection={
        enable=true,
        keymaps={
            init_selection='<CR>',
            scope_incremental='<CR>',
            node_incremental='<TAB>',
            node_decremental='<S-TAB>'
        }
    },
    textobjects={
        select={
            enable=true,
            lookahead=true, -- Automatically jump forward to textobj, similar to targets.vim
            keymaps={
                -- You can use the capture groups defined in textobjects.scm
                ['af']='@function.outer',
                ['if']='@function.inner',
                ['ac']='@class.outer',
                ['ic']='@class.inner'
            }
        },
        move={
            enable=true,
            set_jumps=true, -- whether to set jumps in the jumplist
            goto_next_start={[']m']='@function.outer', [']]']='@class.outer'},
            goto_next_end={[']M']='@function.outer', ['][']='@class.outer'},
            goto_previous_start={['[m']='@function.outer', ['[[']='@class.outer'},
            goto_previous_end={['[M']='@function.outer', ['[]']='@class.outer'}
        }
    }
}
