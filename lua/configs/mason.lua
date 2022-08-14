local mason_ok, mason = pcall(require, 'mason')
if not mason_ok then return end

mason.setup({ui={icons={package_installed='+', package_pending='~', package_uninstalled='-'}}})

local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_ok then return end

mason_lspconfig.setup({
  ensure_installed={
    'bash-language-server',
    'black',
    'dockerfile-language-server',
    'hadolint',
    'luacheck',
    'luaformatter',
    'pyright',
    'sumneko_lua'
  },
  automatic_installation=true
})

local mason_tool_installer_ok, mason_tool_installer = pcall(require, 'mason-tool-installer')
if not mason_tool_installer_ok then return end
mason_tool_installer.setup {
  ensure_installed={
    'bash-language-server',
    'black',
    'dockerfile-language-server',
    'editorconfig-checker',
    'gofumpt',
    'golangci-lint',
    'golines',
    'gomodifytags',
    'gopls',
    'gotests',
    'hadolint',
    'impl',
    'json-to-struct',
    'lua-language-server',
    'luacheck',
    'luaformatter',
    'pyright',
    'shellcheck',
    'shfmt',
    'taplo',
  },
  auto_update=true,
  run_on_start=true,
  start_delay=3000 -- 3 second delay
}
