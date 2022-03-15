local nls = require('null-ls')
local U = require('plugins.lsp.utils')

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

-- Configuring null-ls
nls.setup({
  sources={ -- # FORMATTING #
    dgn.luacheck.with({
      extra_args={'--globals', 'vim', '--std', 'luajit'},
      method=nls.methods.DIAGNOSTICS_ON_SAVE
    }),
    dgn.pylint.with({method=nls.methods.DIAGNOSTICS_ON_SAVE}),
    dgn.shellcheck,
    fmt.gofmt,
    fmt.shfmt,
    fmt.terraform_fmt,
    fmt.trim_whitespace.with({filetypes={'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux'}})
  },
  on_attach=function(client, bufnr)
    U.fmt_on_save(client)
    U.mappings(bufnr)
  end
})
