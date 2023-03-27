local A = vim.api
-- Custom filetypes
vim.filetype.add({
  extension={conf='conf', mdx='markdown', mjml='html'},
  pattern={['.*%.env.*']='sh', ['ignore$']='conf'},
  filename={['yup.lock']='yaml'}
})
local num_au = A.nvim_create_augroup('CFG', {clear=true})
-- Highlight the region on yank
A.nvim_create_autocmd('TextYankPost', {group=num_au, callback=function() vim.highlight.on_yank({higroup='Visual'}) end})
-- Remove useless stuff from the terminal window and enter INSERT mode
A.nvim_create_autocmd('TermOpen', {
  group=num_au,
  callback=function(data)
    if not string.find(vim.bo[data.buf].filetype, '^[fF][tT]erm') then
      A.nvim_set_option_value('number', false, {scope='local'})
      A.nvim_set_option_value('relativenumber', false, {scope='local'})
      A.nvim_set_option_value('signcolumn', 'no', {scope='local'})
      A.nvim_command('startinsert')
    end
  end
})
-- Jump to the last place in the file before exiting
A.nvim_create_autocmd('BufReadPost', {
  group=num_au,
  callback=function(data)
    local last_pos = A.nvim_buf_get_mark(data.buf, '"')
    if last_pos[1] > 0 and last_pos[1] <= A.nvim_buf_line_count(data.buf) then A.nvim_win_set_cursor(0, last_pos) end
  end
})

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
