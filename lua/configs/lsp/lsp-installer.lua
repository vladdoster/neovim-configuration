local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then return end

require('nvim-lsp-installer').setup {
  automatic_installation=true,
  ensure_installed={'pyright', 'dockerls', 'bashls', 'terraform', 'go'},
  max_concurrent_installers=4,
  pip={install_args={}},
  ui={icons={server_installed='+', server_pending='~', server_uninstalled='-'}}
}
