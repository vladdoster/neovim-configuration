require"format".setup {
    ["*"] = {
        {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
    },
    go = {{cmd = {"gofmt -w", "goimports -w"}, tempfile_postfix = ".tmp"}},
    javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    json = {cmd = {cmd = {"prettier -w"}}},
    lua = {{function(file) return string.format("lua-format -i %s", file) end}},
    markdown = {
        {cmd = {"prettier -w"}}, {
            cmd = {"black"},
            start_pattern = "^```python$",
            end_pattern = "^```$",
            target = "current"
        }
    },
    python = {
        cmd = {
            function(file)
                return string.format(
                           "black --skip-magic-trailing-comma --line-length 120 %s",
                           file)
            end
        }
    },
    vim = {
        {
            cmd = {"luafmt -w replace"},
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$"
        }
    },
    vimwiki = {{cmd = {"prettier -w --parser babel"}}}
}
