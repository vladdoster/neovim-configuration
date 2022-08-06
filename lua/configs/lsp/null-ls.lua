local nls, U = require('null-ls'), require('configs.lsp.utils')
local dgn, fmt = nls.builtins.diagnostics, nls.builtins.formatting

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local lsp_formatting = function(bufnr)
  -- vim.lsp.buf.formatting_sync({ filter = function(client) return client.name == "null-ls" end, bufnr = bufnr, })
end

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
    fmt.jq,
    fmt.npm_groovy_lint,
    fmt.lua_format.with({extra_args={'--config', vim.fn.expand('~/.config/nvim/.lua_format.yml'), '--in-place'}}),
    fmt.mdformat,
    fmt.reorder_python_imports,
    fmt.shfmt.with({extra_args={'-i', 2, '-ci', '-sr'}}),
    fmt.terrafmt,
    fmt.terraform_fmt,
    fmt.trim_whitespace
  },
  on_attach=function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = {noremap=true, silent=true}
    require('aerial').on_attach(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      buf_set_keymap('n', '<leader>F',
                     '<cmd>lua vim.lsp.buf.format({filter=function(client) return client.name == \'null-ls\' end, bufnr=bufnr})<CR>',
                     opts)
    end
  end
})
