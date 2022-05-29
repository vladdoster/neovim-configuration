local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then return end

require('nvim-lsp-installer').setup {
  ensure_installed={'pyright', 'dockerls', 'bashls', 'terraform', 'go'},
  automatic_installation=true,
  ui={icons={server_installed='+', server_pending='~', server_uninstalled='-'}},
  pip={install_args={}},
  max_concurrent_installers=4
}
