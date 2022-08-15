local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then return end

treesitter.setup {
  ensure_installed={'bash', 'dockerfile', 'go', 'hcl', 'json', 'python', 'toml', 'yaml'},
  highlight={enable=true, use_languagetree=true},
  indent={enable=true},
  matchup={enable=true},
  rainbow={enable=true}
}
