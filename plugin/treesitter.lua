local ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
local ok_1, parser_configs = pcall(require, 'nvim-treesitter.parsers.get_parser_configs()')
if not ok or not ok_1 then return end

parser_configs.hcl = {filetype='hcl', 'terraform'}

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
