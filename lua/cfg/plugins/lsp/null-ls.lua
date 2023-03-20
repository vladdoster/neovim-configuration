local nls = require('null-ls')
local U = require('cfg.plugins.lsp.utils')
local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
nls.setup({
  sources={fmt.trim_whitespace.with({filetypes={'text', 'zsh', 'toml', 'make', 'conf', 'tmux'}})},
  on_attach=function(client, bufnr)
    U.fmt_on_save(client, bufnr)
    U.mappings(bufnr)
  end
})
