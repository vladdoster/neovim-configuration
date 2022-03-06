local M = {}
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
function M.fmt_on_save(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[ augroup FORMATTING
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
	end
end

function M.disable_formatting(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end

null_ls.setup({
	debug = false,
	sources = {
		diagnostics.flake8.with({ method = null_ls.methods.DIAGNOSTICS_ON_SAVE }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.reorder_python_imports,
		formatting.stylua.with({ extra_args = { "--column-width=120" } }),
		formatting.trim_whitespace.with({
			filetypes = { "text", "sh", "zsh", "toml", "make", "conf", "tmux" },
		}),
	},
	on_attach = function(client, bufnr)
		M.fmt_on_save(client)
	end,
})
return M
