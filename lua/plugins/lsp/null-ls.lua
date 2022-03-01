local nls, U = require("null-ls"), require("plugins.lsp.utils")
local ca, fmt, dgn = nls.builtins.code_actions, nls.builtins.formatting, nls.builtins.diagnostics
--        dgn.codespell,
nls.setup({
	sources = {
		ca.refactoring,
		dgn.actionlint,
		dgn.luacheck.with({ extra_args = { "--globals", "vim", "--std", "luajit" } }),
		dgn.shellcheck,
		dgn.vulture,
		dgn.zsh,
		fmt.black,
		fmt.gofmt,
		fmt.reorder_python_imports,
		fmt.shfmt,
		fmt.stylua,
		fmt.terrafmt,
		fmt.terraform_fmt,
		fmt.trim_whitespace.with({ filetypes = { "conf", "make", "markdown", "sh", "text", "tmux", "toml", "zsh" } }),
	},
	on_attach = function(client, bufnr)
		U.fmt_on_save(client)
		U.mappings(bufnr)
	end,
})
