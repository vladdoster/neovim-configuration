local ok, null_ls = pcall(require, 'null-ls')
if not ok then return end

local dgn, fmt = null_ls.builtins.diagnostics, null_ls.builtins.formatting

local editorconfig_checker = null_ls.builtins.diagnostics.editorconfig_checker
editorconfig_checker._opts.command = 'editorconfig-checker'

-- fmt.beautysh.with({extra_args={'--indent-size', '2', '--force-function-style', 'paronly'}}),
null_ls.setup {
  debounce=150,
  debug=false,
  save_after_format=false,
  sources={
    dgn.checkmake,
    dgn.selene.with({extra_args={'--config', vim.fn.expand('~/.config/nvim/selene.toml')}}),
    dgn.shellcheck,
    fmt.black,
    fmt.gofmt,
    fmt.jq,
    fmt.lua_format.with({extra_args={'--config', vim.fn.expand('~/.config/nvim/.lua_format.yml'), '--in-place'}}),
    fmt.mdformat,
    fmt.npm_groovy_lint.with({extra_args={'--config', vim.fn.expand('~/.config/nvim/.groovylintrc.json')}}),
    fmt.reorder_python_imports,
    fmt.shfmt.with({extra_args={'-i', 2, '-ci', '-sr'}}),
    fmt.terrafmt,
    fmt.terraform_fmt,
    fmt.trim_whitespace
  },
  on_attach=require 'lsp.on-attach'
}
