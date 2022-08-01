local M = {}
-- avoid running in headless mode since it's harder to detect failures
if #vim.api.nvim_list_uis() == 0 then return end

local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

treesitter.setup {
  autopairs={enable=true},
  autotag={enable=true},
  context_commentstring={enable=true, enable_autocmd=false},
  ensure_installed={'bash', 'go', 'hcl', 'java', 'json', 'python', 'python', 'yaml'},
  highlight={enable=true, use_languagetree=true},
  ignore_install={},
  incremental_selection={enable=true},
  indent={enable=false},
  rainbow={disable={'html'}, enable=true, extended_mode=false, max_file_lines=nil},
  sync_install=false
}

return M
