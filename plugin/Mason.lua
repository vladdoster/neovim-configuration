local ok, mason = pcall(require, 'mason')
if not ok then return end

mason.setup {
  log_level=vim.log.levels.WARN,
  max_concurrent_installers=10,
  ui={icons={package_installed='•', package_pending='•', package_uninstalled='•'}}
}

local lsp = {'bash-language-server', 'hadolint', 'lua-language-server', 'luaformatter', 'pyright', 'selene'}
