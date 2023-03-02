local nls = require('null-ls')
local U = require('cfg.plugins.lsp.utils')
local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
nls.setup({
  sources={
    dgn.selene.with({extra_args={'--config', vim.fn.expand('~/.config/nvim/selene.toml')}}),
    dgn.shellcheck,
    fmt.beautysh.with({extra_args={'-i', 2, '-ci', '-sr'}, filetypes={'bash', 'sh', 'zsh'}}),
    fmt.black,
    fmt.gofmt,
    fmt.jq,
    fmt.lua_format.with({extra_args={'--config', vim.fn.expand('~/.config/nvim/.lua_format.yml'), '--in-place'}}),
    fmt.mdformat.with({filetypes={'markdown'}}),
    fmt.npm_groovy_lint.with({extra_args={'--config', vim.fn.expand('~/.config/nvim/.groovylintrc.json')}}),
    fmt.reorder_python_imports,
    fmt.shfmt.with({extra_args={'-i', 2, '-ci', '-sr'}}),
    fmt.terraform_fmt.with({timeout=10000, to_temp_file=false, filetypes={'terraform', 'hcl'}}),
    fmt.trim_whitespace.with({filetypes={'text', 'zsh', 'toml', 'make', 'conf', 'tmux'}})
  },
  on_attach=function(client, bufnr)
    U.fmt_on_save(client, bufnr)
    U.mappings(bufnr)
  end
})
