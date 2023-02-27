require('mason').setup({
  log_level=vim.log.levels.WARN,
  max_concurrent_installers=20,
  ui={icons={package_installed='+', package_pending='~', package_uninstalled='-'}}
})
require('mason-tool-installer').setup({
  ensure_installed={
    'editorconfig-checker',
    'json-to-struct',
    'lua-language-server',
    'luaformatter',
    'misspell',
    'revive',
    'shellcheck',
    'shellcheck',
    'shfmt',
    'staticcheck',
    'vim-language-server',
    {'bash-language-server', auto_update=true},
    {'golangci-lint', version='v1.47.0'}
  },
  auto_update=true,
  run_on_start=true,
  start_delay=3000,
  debounce_hours=5
})
