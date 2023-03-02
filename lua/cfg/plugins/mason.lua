require('mason').setup({
  log_level=vim.log.levels.WARN,
  max_concurrent_installers=100,
  ui={icons={package_installed='+', package_pending='~', package_uninstalled='-'}}
})
require('mason-tool-installer').setup({
  auto_update=true,
  debounce_hours=5,
  run_on_start=true,
  start_delay=3000,
  ensure_installed={
    'editorconfig-checker',
    'lua-language-server',
    'luaformatter',
    'selene',
    {'bash-language-server', auto_update=true}
  }
})
