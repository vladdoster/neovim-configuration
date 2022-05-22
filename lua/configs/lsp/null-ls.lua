local M = {}

function M.setup(options)
  local nls = require('null-ls')
  nls.setup({
    debounce=150,
    save_after_format=false,
    sources={
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.terraform_fmt,
      nls.builtins.formatting.trim_whitespace,
      nls.builtins.diagnostics.shellcheck,
      nls.builtins.diagnostics.markdownlint
    },
    on_attach=options.on_attach,
    root_dir=require('null-ls.utils').root_pattern('.null-ls-root', '.nvim.settings.json', '.git')
  })
end

function M.has_formatter(ft)
  local sources = require('null-ls.sources')
  local available = sources.get_available(ft, 'NULL_LS_FORMATTING')
  return #available > 0
end

return M
