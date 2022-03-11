local K = require('keymap')

K.n('<A-Down>', ':resize +4<CR>')
K.n('<A-Left>', ':vertical resize +4<CR>')
K.n('<A-Right>', ':vertical resize -4<CR>')
K.n('<A-Up>', ':resize -4<CR>')
K.n('<A-\\>', ':split<CR>')
K.n('<A-j>', ':move .+1<CR>')

K.n('<C-Q>', ':q!')
K.n('<C-Q>', ':q<CR>')
K.n('<C-\\>', ':vsplit<CR>')
K.n('<C-h>', '<C-w>h')
K.n('<C-j>', ':m .+1<CR>==')
K.n('<C-j>', '<C-w>j')
K.n('<C-k>', ':m .-2<CR>==')
K.n('<C-k>', ':move .-2<CR>')
K.n('<C-k>', '<C-w>k')
K.n('<C-l>', '<C-w>l')

K.n('<Esc>', ':noh <CR>')

K.n('<Leader>O', 'O<ESC>')
K.n('<Leader>W', ':wall<CR>')
K.n('<Leader>[', ':bp<CR>')
K.n('<Leader>]', ':bn<CR>')
K.n('<Leader>bn', ':bufdo bnext<CR>')
K.n('<Leader>bp', ':bufdo bprevious<CR>')
K.n('<Leader>db', ':bdelete!<CR>')
K.n('<Leader>fb', ':Telescope file_browser<CR>')
K.n('<Leader>ff', ':Telescope find_files<CR>')
K.n('<Leader>fh', ':Telescope help_tags<CR>')
K.n('<Leader>fo', ':Telescope oldfiles<CR>')
K.n('<Leader>fw', ':Telescope live_grep<CR>')
K.n('<Leader>gc', ':Telescope git_commits<CR>')
K.n('<Leader>gt', ':Telescope git_status<CR>')
K.n('<Leader>o', 'o<ESC>')
K.n('<Leader>ps', ':PackerSync<CR>')
K.n('<Leader>st', ':StartupTime<CR>')
K.n('<Leader>tw', ':%s/\\s\\+$//e <CR>')
K.n('<C-n>', ':NvimTreeToggle<CR>')

K.n('<S-h>', ':bprevious<CR>')
K.n('<S-l>', ':bnext<CR>')
K.n('<S-t>', ':enew <CR>')
K.n('<S-w>', ':w <CR>')

K.x('#', 'y?\\V<C-R>"<CR>')
K.x('*', 'y/\\V<C-R>"<CR>')

K.x('<C-s>', ':Sort <CR>')
K.x('<C-j>', ':move \'>+1<CR>gv=gv')
K.x('<C-k>', ':move \'<-2<CR>gv=gv')
