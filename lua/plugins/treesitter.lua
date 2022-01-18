local status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if status_ok then
    local opts = {
        ensure_installed={'python', 'go', 'hcl', 'markdown', 'make', 'dockerfile'},
        ignore_install={},
        highlight={enable=true, additional_vim_regex_highlighting=true, disable={'latex'}},
        context_commentstring={enable=true, config={json=''}},
        indent={enable=true}
    }
    treesitter_configs.setup(opts)
end
