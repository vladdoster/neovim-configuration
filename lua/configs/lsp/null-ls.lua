local nls, U = require('null-ls'), require('configs.lsp.utils')
local dgn, fmt = nls.builtins.diagnostics, nls.builtins.formatting

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_fmt = function(bufnr)
  vim.lsp.buf.format({filter=function(client) return client.name == 'null-ls' end, bufnr=bufnr})
end

local on_attach = function(client, bufnr)
  U.mappings(bufnr)
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({group=augroup, buffer=bufnr})
    vim.api.nvim_create_autocmd('BufWritePre', {group=augroup, buffer=bufnr, callback=function() lsp_fmt(bufnr) end})
  end
end

nls.setup({
  debounce=150,
  debug=false,
  save_after_format=false,
  sources={
    dgn.checkmake,
    dgn.luacheck.with({extra_args={'--globals', 'vim', '--std', 'luajit'}}),
    dgn.shellcheck,
    fmt.black,
    fmt.beautysh,
    fmt.gofmt,
    fmt.lua_format.with {extra_args={'--config', vim.fn.expand('~/.config/nvim/.lua_format.yml'), '--in-place'}},
    fmt.mdformat,
    fmt.reorder_python_imports,
    fmt.shfmt.with({extra_args={'-i', 2, '-ci', '-sr'}}),
    fmt.terraform_fmt,
    fmt.trim_whitespace
  },
  on_attach=on_attach
})
