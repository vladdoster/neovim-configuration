local nls, U = require('null-ls'), require('configs.lsp.utils')
local dgn, fmt = nls.builtins.diagnostics, nls.builtins.formatting

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local lsp_formatting = function(bufnr)
  -- vim.lsp.buf.formatting_sync({ filter = function(client) return client.name == "null-ls" end, bufnr = bufnr, })
  vim.lsp.buf.format({filter=function(client) return client.name == 'null-ls' end, bufnr=bufnr})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({group=augroup, buffer=bufnr})
    vim.api.nvim_create_autocmd('BufWritePre',
                                {group=augroup, buffer=bufnr, callback=function() lsp_formatting(bufnr) end})
  end
end
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
require('null-ls').setup({
  -- you can reuse a shared lspconfig on_attach callback here
  debounce=150,
  debug=false,
  save_after_format=false,
  sources={
    dgn.checkmake,
    dgn.luacheck.with({extra_args={'--globals', 'vim', '--std', 'luajit'}}),
    dgn.shellcheck,
    fmt.beautysh.with({extra_args={'--indent-size', '2', '--force-function-style', 'paronly'}}),
    fmt.black,
    fmt.gofmt,
    fmt.lua_format.with({extra_args={'--config', vim.fn.expand('~/.config/nvim/.lua_format.yml'), '--in-place'}}),
    fmt.mdformat,
    fmt.reorder_python_imports,
    fmt.shfmt.with({extra_args={'-i', 2, '-ci', '-sr'}}),
    fmt.terraform_fmt,
    fmt.trim_whitespace
  },
  on_attach=function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({group=augroup, buffer=bufnr})
      vim.api.nvim_create_autocmd('BufWritePre', {
        group=augroup,
        buffer=bufnr,
        callback=function()
          -- nvim 0.8 -> vim.lsp.buf.format({ bufnr = bufnr })
          -- nvim 0.7 -> vim.lsp.buf.formatting_sync()
          -- vim.lsp.buf.formatting_sync()
          vim.lsp.buf.format({buf=bufnr})
        end
      })
    end
  end
})
