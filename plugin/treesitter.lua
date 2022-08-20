local ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not ok then return end
treesitter_configs.setup {
  auto_install=true,
  ensure_installed={'bash', 'dockerfile', 'go', 'hcl', 'json', 'lua', 'python', 'toml', 'yaml'},
  highlight={enable=true, disable={'c', 'rust'}, additional_vim_regex_highlighting=false},
  ignore_install={'javascript'},
  indent={enable=true},
  matchup={enable=true},
  rainbow={enable=true},
  sync_install=false
}
