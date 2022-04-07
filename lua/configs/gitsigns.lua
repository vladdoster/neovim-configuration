local M = {}

local status_ok, gitsigns = pcall(require, 'gitsigns')
if not status_ok then
  return
end

gitsigns.setup {
  attach_to_untracked = true,
  current_line_blame = false,
  current_line_blame_formatter_opts = { relative_time = false },
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',
    delay = 1000,
    ignore_whitespace = false,
  },
  linehl = false,
  max_file_length = 40000,
  numhl = false,
  preview_config = {
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1,
  },
  sign_priority = 6,
  signcolumn = true,
  signs = {
    add = {
      hl = 'GitSignsAdd',
      text = '+',
      numhl = 'GitSignsAddNr',
      linehl = 'GitSignsAddLn',
    },
    change = {
      hl = 'GitSignsChange',
      text = '~',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
    changedelete = {
      hl = 'GitSignsChange',
      text = '=',
      numhl = 'GitSignsChangeNr',
      linehl = 'GitSignsChangeLn',
    },
    delete = {
      hl = 'GitSignsDelete',
      text = '-',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
    topdelete = {
      hl = 'GitSignsDelete',
      text = '契',
      numhl = 'GitSignsDeleteNr',
      linehl = 'GitSignsDeleteLn',
    },
  },
  status_formatter = nil,
  update_debounce = 100,
  watch_gitdir = { interval = 1000, follow_files = true },
  word_diff = false,
  yadm = { enable = false },
}

return M
