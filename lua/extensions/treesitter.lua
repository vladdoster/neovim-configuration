require('nvim-treesitter.configs').setup({
  ensure_installed = { 'go', 'lua', 'python' },
  sync_install = false,
  highlight = { enable = true, disable = {} },
  indent = { enable = true, disable = {} },
})

--  vim: set expandtab filetype=lua shiftwidth=4 tabstop=4 :
