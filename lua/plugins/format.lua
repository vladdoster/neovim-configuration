local present, format = pcall(require, 'format')
if present then
    format.setup {
        ['*']={{cmd={'sed -i \'s/[ \t]*$//\''}}},
        bash={{cmd={'shfmt -i 4 -s -ln bash -sr -bn -ci -w'}}},
        go={{cmd={'gofmt -w', 'goimports -w'}, tempfile_postfix='.tmp'}},
        lua={{cmd={'lua-format --column-limit 120 --in-place'}}},
        python={{cmd={'black -l 160', 'isort'}, tempfile_postfix='.tmp'}},
        sh={{cmd={'shfmt -i 4 -s -ln bash -sr -bn -ci -w'}}},
        terraform={{cmd={'terraform fmt'}}},
        yaml={{cmd={'yamlfmt -w'}}},
        zsh={{cmd={'shfmt -i 4 -s -ln bash -sr -bn -ci -w'}}},
        markdown={
            {cmd={'mdformat'}},
            {
                cmd={'black'},
                start_pattern='^```python$',
                end_pattern='^```$',
                target='current'
            },
            {
                cmd={'shfmt -w'},
                start_pattern='^```bash$',
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