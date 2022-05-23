local M = {}

function M.setup(options)
  local nls = require 'null-ls'
  local format, diagnostics = nls.builtins.formatting, nls.builtins.diagnostics
  vim.lsp.buf.format { timeout_ms = 2000 } -- nvim v0.8.0
  -- vim.lsp.buf.formatting_sync(nil, 2000) -- v0.7.0
  nls.setup {
    debounce = 150,
    save_after_format = false,
    sources = {
      diagnostics.mdformat,
      diagnostics.shellcheck,
      format.black,
      format.reorder_python_imports,
      format.stylua,
      format.terraform_fmt,
      format.trim_whitespace,
    },
    on_attach = options.on_attach,
    root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.nvim.settings.json', '.git'),
  }
end

function M.has_formatter(ft)
  local sources = require 'null-ls.sources'
  local available = sources.get_available(ft, 'NULL_LS_FORMATTING')
  return #available > 0
end

return M
