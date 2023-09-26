local U = require('cfg.plugins.lsp.utils')

require("mason").setup({})
require("mason-null-ls").setup({
  ensure_installed={'lua-language-server', 'pyright', 'black'},
  max_concurrent_installers=5,
  automatic_installation=true,
  handlers={}
})

local nls = require('null-ls')
local dgn = nls.builtins.diagnostics
local fmt = nls.builtins.formatting

nls.setup({
  sources={
    dgn.commitlint,
    dgn.hadolint,
    fmt.trim_whitespace.with({filetypes={'conf', 'lua', 'make', 'md', 'mdx', 'text', 'tmux', 'toml', 'zsh', 'py'}}),
    fmt.black,
    fmt.isort
  },
  on_attach=function(client, bufnr)
    U.fmt_on_save(client, bufnr)
    U.mappings(bufnr)
  end
})

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
