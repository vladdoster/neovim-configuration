local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then return end

indent_blankline.setup({
  buftype_exclude = { 'nofile', 'terminal' },
  enabled = true,
  filetype_exclude = { 'help', 'lazy', 'neotree', 'text' },
  show_current_context = true,
  show_first_indent_level = true,
  show_trailing_blankline_indent = false,
  use_treesitter = true,
})
