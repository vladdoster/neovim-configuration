local function map(m, k, v) vim.keymap.set(m, k, v, {silent=true}) end
local keymap = vim.keymap.set
-- fix * (keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Remap for dealing with word wrap
keymap('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', {expr=true, silent=true})
keymap('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', {expr=true, silent=true})

-- fix n and N. keeping cursor in center
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- mimic shell movements
map('i', '<C-E>', '<C-o>$')
map('i', '<C-A>', '<C-o>^')

-- quickly save the current buffer or all buffers
map('n', '<leader>w', '<CMD>update<CR>')
map('n', '<leader>W', '<CMD>wall<CR>')

-- quit neovim
map('n', '<C-Q>', '<CMD>q<CR>')

-- leader-o/o inserts blank line below/above
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- shortcut to yank register
map({'n', 'x'}, '<leader>p', '"0p')

-- move to the next/previous buffer
map('n', '<leader>[', '<CMD>bp<CR>')
map('n', '<leader>]', '<CMD>bn<CR>')

-- move to last buffer
map('n', '\'\'', '<CMD>b#<CR>')

-- copying the vscode behaviour of making tab splits
map('n', '<C-\\>', '<CMD>vsplit<CR>')
map('n', '<A-\\>', '<CMD>split<CR>')

-- delete blank lines
-- vim.api.nvim_create_user_command('deleteblanklines', function()
--   print('deleting blank lines')
--   vim.cmd(':%g/^$/d')
-- end, {})

-- move line up and down in normal and visual modes
-- reference: https://vim.fandom.com/wiki/moving_lines_up_or_down
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ':move \'>+1<CR>gv=gv')
map('x', '<C-k>', ':move \'<-2<CR>gv=gv')

map('v', '<', '<gv')
map('v', '>', '>gv')

-- use operator pending mode to visually select the whole buffer
-- e.g. da = delete buffer all, ya = copy whole buffer all
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

map('n', '<ESC>', '<CMD>nohlsearch<CR>')

map('v', '<C-s>', ':Sort<CR>')

-- vertically resize window
map('n', '=', [[<cmd>vertical resize +5<cr>]])
map('n', '-', [[<cmd>vertical resize -5<cr>]])

-- horizontally resize window
map('n', '+', [[<cmd>horizontal resize +2<cr>]])
map('n', '_', [[<cmd>horizontal resize -2<cr>]])

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
