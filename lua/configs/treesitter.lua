local M = {}
local loaded, treesitter = pcall(require, 'nvim-treesitter.configs')
if not loaded then
  return
end
treesitter.setup {
  autopairs = { enable = true },
  incremental_selection = { enable = true },
  autotag = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = false },
  ensure_installed = { 'bash', 'hcl', 'java', 'python', 'yaml' }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  ignore_install = {},
  indent = { enable = false },
  rainbow = {
    enable = true,
    disable = { 'html' },
    extended_mode = false,
    max_file_lines = nil,
  },
  sync_install = false,
}
return M
