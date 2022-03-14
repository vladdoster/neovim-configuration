local nls = require('null-ls')
local U = require('plugins.lsp.utils')

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

-- Configuring null-ls
nls.setup({
  sources={ -- # FORMATTING #
    fmt.trim_whitespace.with({filetypes={'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux'}}),
    fmt.terraform_fmt,
    fmt.gofmt,
    fmt.shfmt,
    fmt.lua_format,
    dgn.shellcheck,
    dgn.luacheck.with({
      extra_args={'--globals', 'vim', '--std', 'luajit'},
      method=nls.methods.DIAGNOSTICS_ON_SAVE
    }),
    dgn.pylint.with({method=nls.methods.DIAGNOSTICS_ON_SAVE})
  },
  on_attach=function(client, bufnr)
    U.fmt_on_save(client)
    U.mappings(bufnr)
  end
})
