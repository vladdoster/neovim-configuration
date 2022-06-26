local nls, U = require('null-ls'), require('configs.lsp.utils')

local dgn, fmt = nls.builtins.diagnostics, nls.builtins.formatting

-- vim.lsp.buf.format {timeout_ms=2000} -- nvim v0.8.0

nls.setup({
  debounce=150,
  save_after_format=false,
  sources={
    dgn.checkmake,
    dgn.luacheck.with({extra_args={'--globals', 'vim', '--std', 'luajit'}}),
    dgn.shellcheck,
    fmt.black,
    fmt.gofmt,
    fmt.lua_format.with {extra_args={'--config', vim.fn.expand('~/.config/nvim/.lua_format.yml'), '--in-place'}},
    fmt.mdformat,
    fmt.reorder_python_imports,
    fmt.shfmt.with({extra_args={'-i', 2, '-ci', '-sr'}}),
    fmt.terraform_fmt,
    fmt.trim_whitespace,
    fmt.zsh

  },
  on_attach=function(client, bufnr)
    U.fmt_on_save(client, bufnr)
    U.mappings(bufnr)
  end
})
