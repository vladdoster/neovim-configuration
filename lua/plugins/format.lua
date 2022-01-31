local present, format = pcall(require, 'format')
if present then
    format.setup {
        ['*']={{cmd={'sed -i \'s/[ \t]*$//\''}}},
        bash={{cmd={'shfmt -bn -ci -i 2 -sr -w'}}},
        go={{cmd={'gofmt -w', 'goimports -w'}, tempfile_postfix='.tmp'}},
        lua={{cmd={'lua-format --column-limit 120 --in-place'}}},
        python={{cmd={'black -l 160', 'isort'}, tempfile_postfix='.tmp'}},
        sh={{cmd={'shfmt -i 2 -s -sr -bn -ci -w'}}},
        terraform={{cmd={'terraform fmt'}}},
        yaml={{cmd={'yamlfmt -w'}}},
        zsh={{cmd={'shfmt -i 2 -s -ln bash -sr -bn -ci -w'}}},
        markdown={
            {cmd={'mdformat --wrap 100'}},
            {
                cmd={'black'},
                start_pattern='^```python$',
                end_pattern='^```$',
                target='current'
            },
            {
                cmd={'shfmt -bn -ci -i 2 -sr -s -w'},
                start_pattern='^```(bash|sh|shell)$',
                end_pattern='^```$',
                target='current'
            },
            {
                cmd={'yamlfmt -w'},
                start_pattern='^```ya?ml$',
                end_pattern='^```$',
                target='current'
            }
        }
    }
end
