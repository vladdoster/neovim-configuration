local ok, mason = pcall(require, 'mason')
if not ok then return end
mason.setup {
  log_level=vim.log.levels.ERROR,
  max_concurrent_installers=10,
  ui={icons={package_installed='', package_pending='', package_uninstalled=''}}
}

local lsp = {'bash-language-server', 'hadolint', 'lua-language-server', 'luaformatter', 'pyright', 'selene'}
local usr_cmd = vim.api.nvim_create_user_command
usr_cmd('MasonInstallAll', function() vim.cmd('MasonInstall ' .. table.concat(lsp, ' ')) end, {})
