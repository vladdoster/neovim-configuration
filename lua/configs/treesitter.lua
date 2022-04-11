local M = {}
local loaded, treesitter = pcall(require, 'nvim-treesitter.configs')
if not loaded then return end
treesitter.setup {
  autopairs={enable=true},
  autotag={enable=true},
  context_commentstring={enable=true, enable_autocmd=false},
  ensure_installed={'bash', 'hcl', 'java', 'python', 'yaml'},
  highlight={additional_vim_regex_highlighting=false, enable=true},
  ignore_install={},
  incremental_selection={enable=true},
  indent={enable=false},
  rainbow={disable={'html'}, enable=true, extended_mode=false, max_file_lines=nil},
  sync_install=false
}
return M
