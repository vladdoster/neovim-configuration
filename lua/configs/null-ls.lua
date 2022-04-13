local nls = require 'null-ls'
local fmt = nls.builtins.formatting
local dgn = nls.builtins.diagnostics
local function fmt_on_save(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
            augroup FORMATTING
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
  end
end
-- CONFIGURING NULL-LS
nls.setup {
  sources={ -- # FORMATTING #
    dgn.hadolint,
    dgn.luacheck.with {
      extra_args={'--globals', 'vim', '--std', 'luajit'},
      method=nls.methods.DIAGNOSTICS_ON_SAVE
    },
    dgn.pylint.with {method=nls.methods.DIAGNOSTICS_ON_SAVE},
    dgn.shellcheck,
    dgn.zsh,
    fmt.gofmt,
    fmt.shfmt.with {extra_args={'-i', 2, '-s', '-ci', '-sr', '-bn'}},
    fmt.stylua.with {extra_args={'-f', '$HOME/.config/nvim/.stylua.toml'}},
    fmt.terraform_fmt,
    fmt.trim_newlines,
    fmt.trim_whitespace.with({filetypes={'text', 'sh', 'zsh', 'toml', 'make', 'conf', 'tmux'}})
  },
  on_attach=function(client, bufnr) fmt_on_save(client) end
}
