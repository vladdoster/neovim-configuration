local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
null_ls.setup({
	debug = false,
	sources = {
		diagnostics.flake8.with({ method = null_ls.methods.DIAGNOSTICS_ON_SAVE }),
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.stylua.with({ extra_args = { "--column-width=120" } }),
		formatting.reorder_python_imports,
		formatting.trim_whitespace,
	},
})
