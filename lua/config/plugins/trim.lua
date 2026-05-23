return {
  spec = { src = 'https://github.com/cappyzawa/trim.nvim', name = 'trim.nvim' },
  setup = function()
    require('trim').setup({
      ft_blocklist = { 'markdown' },
      highlight = true,
      patterns = { [[%s/\(\n\n\)\n\+/\1/]] },
      trim_current_line = false,
      trim_on_write = false,
    })
  end,
}
