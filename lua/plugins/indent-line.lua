local status_ok, indent_blankline = pcall(require, "indent_blankline")
if status_ok then
  indent_blankline.setup({
    char = "▏",
    show_first_indent_level = false,
    filetype_exclude = {
      "help",
      "git",
      "markdown",
      "text",
      "terminal",
      "lspinfo",
      "packer",
    },
    buftype_exclude = {
      "terminal",
      "nofile",
    },
  })
end
