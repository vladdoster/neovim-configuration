api = vim.api
augroup = vim.api.nvim_create_augroup
autocmd = vim.api.nvim_create_autocmd
bo = vim.bo
cmd = vim.cmd
fn = vim.fn
g = vim.g
keymap = vim.keymap
lsp = vim.lsp
opt = vim.opt

-- Generate modeline
function generateModeline()
  local commentString = opt.commentstring:get()
  if string.match(commentString, '%%s(.*)') ~= '' then local spaceIfNeeded = ' ' end
  local modelineElements = {
    ' vim: set',
    'expandtab',
    'filetype=' .. vim.bo.filetype,
    'shiftwidth=4',
    'tabstop=4',
    ':',
  }
  local modelineConcat = table.concat(modelineElements, ' ')
  local modeline = commentString:gsub('%%s', modelineConcat) -- Place modeline in commentstring correctly
  return modeline
end

-- Insert modeline in buffer
function insertModeline()
  local modeline = generateModeline()
  local buffer = api.nvim_win_get_buf(0)
  local currentLine = api.nvim_buf_get_lines(buffer, -2, -1, true)[1] -- Get current first line to check

  if currentLine == modeline then
  elseif string.match(currentLine, 'vim:') then
    api.nvim_buf_set_lines(0, -2, -1, true, { modeline })
    print('Changed modeline.')
  else
    api.nvim_buf_set_lines(0, -2, -1, true, { modeline })
    print('Inserted modeline.')
  end
end

--  vim: set expandtab filetype=lua shiftwidth=4 tabstop=4 :
