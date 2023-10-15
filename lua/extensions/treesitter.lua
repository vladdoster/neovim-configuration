require'nvim-treesitter.configs'.setup{
  ensure_installed={"lua", "typescript", "javascript", "go", "python"},
  sync_install=false,
  highlight={
    enable=true,
    disable={}
  },
  indent={
    enable=false,
    disable={}
  }
}

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
