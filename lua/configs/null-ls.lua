local M = {}
function M.config()
    local status_ok, null_ls = pcall(require, 'null-ls')
    if not status_ok then return end
    local cmp = null_ls.builtins.completion
    local fmt = null_ls.builtins.formatting
    local diag = null_ls.builtins.diagnostics
    null_ls.setup {
        debug=false,
        sources={
            cmp.spell,
            diag.eslint,
            diag.shellcheck.with({diagnostics_format='[#{c}] #{m} (#{s})'}),
            diag.checkmake,
            diag.pylint,
            fmt.black,
            fmt.isort,
            fmt.terraform_fmt,
            fmt.shfmt.with({extra_args={'-i', '2', '-ci'}}),
            fmt.lua_format
        },
        on_attach=function(client) -- format on save
            if client.resolved_capabilities.document_formatting then
                vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
            end
        end
    }
end
return M
