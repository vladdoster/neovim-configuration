local nls = require('null-ls')
local U = require('plugins.lsp.utils')
local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
nls.setup({
  sources = {
    fmt.trim_whitespace.with({
      filetypes = {'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux'}
    }),
    fmt.prettierd,
    fmt.eslint_d,
    fmt.rustfmt,
    fmt.stylua,
    fmt.terraform_fmt,
    fmt.gofmt,
    fmt.shfmt,
    dgn.eslint_d,
    dgn.shellcheck,
    dgn.luacheck.with({extra_args = {'--globals', 'vim', '--std', 'luajit'}})
  },
  on_attach = function(client, bufnr)
    U.fmt_on_save(client)
    U.mappings(bufnr)
  end
})