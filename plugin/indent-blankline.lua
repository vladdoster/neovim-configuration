local ok, indent_blankline = pcall(require, 'indent_blankline')
if not ok then return end

indent_blankline.setup {
  buftype_exclude={'terminal', 'nofile'},
  char='▏',
  filetype_exclude={'help', 'git', 'markdown', 'text', 'terminal', 'lspinfo', 'packer'},
  show_current_context=true,
  show_current_context_start=true,
  show_first_indent_level=false,
  use_treesitter_scope=true
}
