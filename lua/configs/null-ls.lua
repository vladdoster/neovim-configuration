local M = {}
function M.config()
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then return end
    -- supported formatters & linters -> https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    null_ls.setup {
        debug = false,
        sources = {
            formatting.rufo, 
            diagnostics.rubocop
        },
        on_attach = function(client) -- format on save
            if client.resolved_capabilities.document_formatting then
                vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
            end
        end
    }
end
return M
