local loaded, trouble = pcall(require, 'trouble')
if not loaded then
  return
end
trouble.setup({
  icons = false,
  fold_open = 'v',
  fold_closed = '>',
  indent_lines = false,
  signs = {
    error = 'error',
    hint = 'hint',
    information = 'info',
    warning = 'warn',
  },
  use_diagnostic_signs = false,
})
