local nls = require('null-ls')
local U = require('configs.lsp.utils')

local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics

-- Configuring null-ls
nls.setup({
  sources = { -- # FORMATTING #
    dgn.luacheck.with({
      extra_args = { '--globals', 'vim', '--std', 'luajit' },
      method = nls.methods.DIAGNOSTICS_ON_SAVE,
    }),
    dgn.hadolint,
    dgn.pylint.with({ method = nls.methods.DIAGNOSTICS_ON_SAVE }),
    dgn.shellcheck,
    dgn.zsh,
    fmt.gofmt,
    fmt.shfmt.with({ extra_args = { '-i', 2, '-s', '-ci', '-sr', '-bn' } }),
    fmt.stylua.with({
      extra_args = {
        '--quote-style',
        'ForceSingle',
        '--indent-type',
        'Spaces',
        '--indent-width',
        2,
        '--column-width',
        120,
      },
    }),
    fmt.terraform_fmt,
    fmt.trim_newlines,
    fmt.trim_whitespace,
  },
  on_attach = function(client, bufnr)
    U.fmt_on_save(client)
    U.mappings(bufnr)
  end,
})
