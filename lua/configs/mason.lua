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
