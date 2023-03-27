local nls = require('null-ls')
local U = require('cfg.plugins.lsp.utils')
local cac = nls.builtins.code_actions
local dgn = nls.builtins.diagnostics
local fmt = nls.builtins.formatting
nls.setup({
  sources={
cac.eslint,
dgn.eslint,
dgn.selene,
dgn.zsh,
fmt.fixjson,
fmt.prettierd,
fmt.trim_whitespace.with({filetypes={'conf', 'lua', 'make', 'md', 'mdx', 'text','tmux','toml','zsh'}}),
  },
  on_attach=function(client, bufnr)
    U.fmt_on_save(client, bufnr)
    U.mappings(bufnr)
  end
})

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
