local ok, autopairs = pcall(require, 'nvim-autopairs')
if not ok then return end

autopairs.setup({
  enable_check_bracket_line=true,
  ignored_next_char='[%w%.]' -- will ignore alphanumeric and `.` symbol

})
