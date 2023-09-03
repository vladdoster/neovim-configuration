local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- better up/down
map({'n', 'x'}, 'j', [[v:count == 0 ? 'gj' : 'j']], {expr=true, silent=true})
map({'n', 'x'}, 'k', [[v:count == 0 ? 'gk' : 'k']], {expr=true, silent=true})

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', {remap=true})
map('n', '<C-j>', '<C-w>j', {remap=true})
map('n', '<C-k>', '<C-w>k', {remap=true})
map('n', '<C-l>', '<C-w>l', {remap=true})

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>')
map('n', '<C-Down>', '<cmd>resize -2<cr>')
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>')
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>')

-- Move Lines
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi')
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi')

-- map('n', '<A-j>', '<cmd>m .+1<cr>==')
-- map('n', '<A-k>', '<cmd>m .-2<cr>==')
map('n', '<C-j>', '<cmd>move .+1<cr>==')
map('n', '<C-k>', '<cmd>move .-2<cr>==')
map('v', '<A-j>', ':move \'>+1<cr>gv=gv\'')
map('v', '<A-k>', ':move \'<-2<cr>gv=gv\'')
map('x', '<C-j>', [[:move \'>+1<CR>gv=gv']])
map('x', '<C-k>', [[:move \'<-2<CR>gv=gv']])

map('n', '<S-h>', '<cmd>bprevious<cr>')
map('n', '<S-l>', '<cmd>bnext<cr>')
map('n', '[b', '<cmd>bprevious<cr>')
map('n', ']b', '<cmd>bnext<cr>')
map('n', '<leader>bb', '<cmd>e #<cr>')
map('n', '<leader>`', '<cmd>e #<cr>')

-- Clear search with <esc>
map({'i', 'n'}, '<esc>', '<cmd>noh<cr><esc>')

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map('n', '<leader>ur', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>')

map({'n', 'x'}, 'gw', '*N')
-- save file
map({'i', 'v', 'n', 's'}, '<C-s>', '<cmd>w<cr><esc>')

-- keywordprg
map('n', '<leader>K', '<cmd>norm! K<cr>')

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')
-- packer
map('n', '<leader>ps', '<cmd>PackerSync<cr>')
-- new file
map('n', '<leader>fn', '<cmd>enew<cr>')
-- quit
map('n', '<leader>qq', '<cmd>q<cr>')
-- highlights under cursor
if vim.fn.has('nvim-0.9.0') == 1 then
  map('n', '<leader>ui', vim.show_pos)
end
-- Terminal Mappings
map('t', '<esc><esc>', '<c-\\><c-n>')
map('t', '<C-h>', '<cmd>wincmd h<cr>')
map('t', '<C-j>', '<cmd>wincmd j<cr>')
map('t', '<C-k>', '<cmd>wincmd k<cr>')
map('t', '<C-l>', '<cmd>wincmd l<cr>')
map('t', '<C-/>', '<cmd>close<cr>')
map('t', '<c-_>', '<cmd>close<cr>')

-- windows
map('n', '<leader>ww', '<C-W>p', {remap=true})
map('n', '<leader>wd', '<C-W>c', {remap=true})
map('n', '<leader>w-', '<C-W>s', {remap=true})
map('n', '<leader>w|', '<C-W>v', {remap=true})
map('n', '<leader>-', '<C-W>s', {remap=true})
map('n', '<leader>|', '<C-W>v', {remap=true})

-- tabs
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>')
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>')
map('n', '<leader><tab>]', '<cmd>tabnext<cr>')
map('n', '<leader><tab>d', '<cmd>tabclose<cr>')
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>')
map('n', '<leader><tab>l', '<cmd>tablast<cr>')

map('v', '<C-s>', '<cmd>Sort<cr>')
-- save the current buffer or all buffers
map('n', '<leader>W', '<cmd>wall<Cr>')
map('n', '<leader>w', '<cmd>update<cr>')

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
