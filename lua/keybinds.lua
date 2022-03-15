local K = require('keymap')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- [[ Modes ]]
-- normal_mode = "n", insert_mode       = "i",
-- visual_mode = "v", visual_block_mode = "x",
-- term_mode   = "t", command_mode      = "c",
--[[ NORMAL ]]
-- window navigation
K.n('<C-h>', '<C-w>h')
K.n('<C-j>', '<C-w>j')
K.n('<C-k>', '<C-w>k')
K.n('<C-l>', '<C-w>l')
-- resize with arrows
K.n('<C-Down>', ':resize +2<CR>')
K.n('<C-Left>', ':vertical resize -2<CR>')
K.n('<C-Right>', ':vertical resize +2<CR>')
K.n('<C-Up>', ':resize -2<CR>')
-- nvimtree
K.n('<C-n>', '<Esc>:NvimTreeToggle<CR>')
-- navigate buffers
K.n('<S-l>', ':bnext<CR>')
K.n('<S-h>', ':bprevious<CR>')
-- move text up and down
K.n('<A-j>', ':m .+1<CR>==gi')
K.n('<A-k>', ':m .-2<CR>==gi')
-- telescope
K.n('<Leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
K.n('<Leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
K.n('<Leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
K.n('<Leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]])
K.n('<Leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]])
K.n('<Leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
K.n('<Leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]])
K.n('<Leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
K.n('<Leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]])
--[[ INSERT ]]
K.i('jk', '<ESC>')
--[[ VISUAL ]]
-- persistent indent mode
K.v('<', '<gv')
K.v('>', '>gv')
-- sort
K.v('<C-s>', ':Sort<CR>')
-- move text up and down
K.v('<A-j>', ':m .+1<CR>==')
K.v('<A-k>', ':m .-2<CR>==')
K.v('p', '"_dP')
--[[ VISUAL BLOCK ]]
-- move text up and down
K.x('<A-j>', ':move \'>+1<CR>gv-gv')
K.x('<A-k>', ':move \'<-2<CR>gv-gv')
K.x('J', ':move \'>+1<CR>gv-gv')
K.x('K', ':move \'<-2<CR>gv-gv')
--[[ TERMINAL ]]
-- navigation
K.t('<C-h>', '<C-\\><C-N><C-w>h')
K.t('<C-j>', '<C-\\><C-N><C-w>j')
K.t('<C-k>', '<C-\\><C-N><C-w>k')
K.t('<C-l>', '<C-\\><C-N><C-w>l')
