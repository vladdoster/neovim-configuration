local U = require('cfg.plugins.lsp.utils')
require('mason').setup({
  log_level=vim.log.levels.WARN,
  max_concurrent_installers=25,
  ui={icons={package_installed='+', package_pending='~', package_uninstalled='-'}}
})
local nls = require('null-ls')
local cac = nls.builtins.code_actions
local dgn = nls.builtins.diagnostics
local fmt = nls.builtins.formatting
nls.setup({
  sources={
    cac.eslint,
    dgn.checkmake,
    dgn.commitlint,
    dgn.eslint,
    dgn.hadolint,
    dgn.zsh,
    fmt.fixjson,
    fmt.luaformatter,
    fmt.prettierd,
    fmt.trim_whitespace.with({filetypes={'conf', 'lua', 'make', 'md', 'mdx', 'text', 'tmux', 'toml', 'zsh'}})
  },
  on_attach=function(client, bufnr)
    U.fmt_on_save(client, bufnr)
    U.mappings(bufnr)
  end
})
require('mason-null-ls').setup({
  ensure_installed={'bash-language-server', 'editorconfig-checker', 'lua-language-server', 'luaformatter'},
  automatic_installation=true,
  automatic_setup=false
})

local servers = {
  "cssls", "lua_ls", "rust_analyzer", "eslint", "html", "jsonls", "tsserver",
  "julials", "marksman"
}

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
