local K = require 'keymap'
local map = vim.api.nvim_set_keymap
map('', '<Space>', '<Nop>', { noremap = true, silent = true })
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
-- disable Ex mode:
K.n('n', 'Q', '<Nop>')
-- Standard Operations
K.n('<leader>w', '<cmd>w<CR>')
K.n('<leader>q', '<cmd>q<CR>')
K.n('<leader>c', '<cmd>Bdelete!<CR>')
K.n('<leader>h', '<cmd>nohlsearch<CR>')
-- Packer
K.n('<leader>pc', '<cmd>PackerCompile<cr>')
K.n('<leader>pi', '<cmd>PackerInstall<cr>')
K.n('<leader>ps', '<cmd>PackerSync<cr>')
K.n('<leader>pS', '<cmd>PackerStatus<cr>')
K.n('<leader>pu', '<cmd>PackerUpdate<cr>')
-- LSP
K.n('<leader>lf', '<cmd>lua vim.lsp.buf.formatting_sync()<cr>')
K.n('<leader>li', '<cmd>LspInfo<cr>')
K.n('<leader>lI', '<cmd>LspInstallInfo<cr>')
-- NvimTree
K.n('<leader>e', '<cmd>NvimTreeToggle<CR>')
K.n('<leader>o', '<cmd>NvimTreeFocus<CR>')
-- GitSigns
K.n('<leader>gd', '<cmd>Gitsigns diffthis HEAD<cr>')
K.n('<leader>gh', '<cmd>lua require \'gitsigns\'.reset_hunk()<cr>')
K.n('<leader>gj', '<cmd>lua require \'gitsigns\'.next_hunk()<cr>')
K.n('<leader>gk', '<cmd>lua require \'gitsigns\'.prev_hunk()<cr>')
K.n('<leader>gl', '<cmd>lua require \'gitsigns\'.blame_line()<cr>')
K.n('<leader>gp', '<cmd>lua require \'gitsigns\'.preview_hunk()<cr>')
K.n('<leader>gr', '<cmd>lua require \'gitsigns\'.reset_buffer()<cr>')
K.n('<leader>gs', '<cmd>lua require \'gitsigns\'.stage_hunk()<cr>')
K.n('<leader>gu', '<cmd>lua require \'gitsigns\'.undo_stage_hunk()<cr>')
-- Telescope
K.n('<leader>fb', '<cmd>Telescope buffers<CR>')
K.n('<leader>ff', '<cmd>Telescope find_files<CR>')
K.n('<leader>fh', '<cmd>Telescope help_tags<CR>')
K.n('<leader>fo', '<cmd>Telescope oldfiles<CR>')
K.n('<leader>fw', '<cmd>Telescope live_grep<CR>')
K.n('<leader>gb', '<cmd>Telescope git_branches<CR>')
K.n('<leader>gc', '<cmd>Telescope git_commits<CR>')
K.n('<leader>gt', '<cmd>Telescope git_status<CR>')
K.n('<leader>lD', '<cmd>Telescope diagnostics<CR>')
K.n('<leader>lR', '<cmd>Telescope lsp_references<CR>')
K.n('<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>')
K.n('<leader>sb', '<cmd>Telescope git_branches<CR>')
K.n('<leader>sc', '<cmd>Telescope commands<CR>')
K.n('<leader>sh', '<cmd>Telescope help_tags<CR>')
K.n('<leader>sk', '<cmd>Telescope keymaps<CR>')
K.n('<leader>sm', '<cmd>Telescope man_pages<CR>')
K.n('<leader>sn', '<cmd>Telescope notifications<CR>')
K.n('<leader>sr', '<cmd>Telescope registers<CR>')
-- LSP
K.n('<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>')
K.n('<leader>ld', '<cmd>lua vim.diagnostic.open_float()<CR>')
K.n('<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')
K.n('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
K.n('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
K.n('[d', '<cmd>lua vim.diagnostic.goto_prev({ border = \'rounded\' })<CR>')
K.n(']d', '<cmd>lua vim.diagnostic.goto_next({ border = \'rounded\' })<CR>')
K.n('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
K.n('gI', '<cmd>lua vim.lsp.buf.implementation()<CR>')
K.n('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
K.n('gj', '<cmd>lua vim.diagnostic.goto_next({ border = \'rounded\' })<cr>')
K.n('gk', '<cmd>lua vim.diagnostic.goto_prev({ border = \'rounded\' })<cr>')
K.n('gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
K.n('go', '<cmd>lua vim.diagnostic.open_float()<CR>')
K.n('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
-- Comment
K.n('<leader>/', '<cmd>lua require(\'Comment.api\').toggle_current_linewise()<cr>')
K.n('<leader>/', '<esc><cmd>lua require(\'Comment.api\').toggle_linewise_op(vim.fn.visualmode())<CR>')
-- ForceWrite
K.n('<C-s>', '<cmd>w!<CR>')
-- ForceQuit
K.n('<C-q>', '<cmd>q!<CR>')
-- Terminal
K.n('<C-\\>', '<cmd>ToggleTerm<CR>')
K.n('<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
K.n('<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
K.n('<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>')
-- Trouble
K.n('<leader>xx', '<cmd>Trouble<cr>')
K.n('<leader>xw', '<cmd>Trouble workspace_diagnostics<cr>')
K.n('<leader>xd', '<cmd>Trouble document_diagnostics<cr>')
K.n('<leader>xl', '<cmd>Trouble loclist<cr>')
K.n('<leader>xq', '<cmd>Trouble quickfix<cr>')
K.n('gR', '<cmd>Trouble lsp_references<cr>')
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
-- toggle terminal
K.t('<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
K.t('<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
K.t('<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>')
