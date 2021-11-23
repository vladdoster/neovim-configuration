local utils = require 'core.utils'
local map = utils.map
local cmd = vim.cmd
local M = {}

M.telescope = function()
    map('n', '<leader>fb', ':Telescope buffers <CR>')
    map('n', '<leader>ff', ':Telescope find_files <CR>')
    map('n', '<leader>fa', ':Telescope find_files hidden=true <CR>')
    map('n', '<leader>cm', ':Telescope git_commits <CR>')
    map('n', '<leader>gt', ':Telescope git_status <CR>')
    map('n', '<leader>fh', ':Telescope help_tags <CR>')
    map('n', '<leader>fw', ':Telescope live_grep <CR>')
    map('n', '<leader>fo', ':Telescope oldfiles <CR>')
end

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap=true, silent=true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remap for dealing with word wrap
map('n', '<Down>', 'v:count == 0 ? \'gk\' : \'k\'', {noremap=true, expr=true, silent=true})
map('n', '<Up>', 'v:count == 0 ? \'gj\' : \'j\'', {noremap=true, expr=true, silent=true})
map('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', {noremap=true, expr=true, silent=true})
map('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', {noremap=true, expr=true, silent=true})

map('n', '<Esc>', ':noh <CR>')
map('v', 'p', '"_dP')

map({'n', 'v'}, 'x', '"_x')
map({'n', 'v'}, 'dd', '"_dd')

map('n', '<S-t>', ':enew <CR>') -- new buffer
map('n', '<C-s>', ':w <CR>') -- ctrl + s to save file
map('v', '<C-s>', ':sort<CR>')

-- move lines up || down
map('v', 'J', ':move \'>+1<CR>gv-gv')
map('v', 'K', ':move \'<-2<CR>gv-gv')

-- better indenting
map('v', '>', '>gv')
map('v', '<', '<gv')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
map('t', '<Esc>', '<C-\\><C-n><C-w>w')

map('n', '<A-Up>', ':resize -2<CR>')
map('n', '<A-Down>', ':resize +2<CR>')
map('n', '<A-Right>', ':vertical resize -2<CR>')
map('n', '<A-Left>', ':vertical resize +2<CR>')

map('n', '<Leader>bn', ':bufdo bnext<CR>')
map('n', '<Leader>bp', ':bufdo bprevious<CR>')

map('n', '<leader>fm', ':FormatWrite<CR>')
map('n', '<leader>mw', ':!mdformat --wrap 80 %<CR>')
map('n', '<C-n>', ':NvimTreeToggle<CR>')

cmd 'silent! command PackerClean lua require \'plugins\' require(\'packer\').clean()'
cmd 'silent! command PackerCompile lua require \'plugins\' require(\'packer\').compile()'
cmd 'silent! command PackerInstall lua require \'plugins\' require(\'packer\').install()'
cmd 'silent! command PackerStatus lua require \'plugins\' require(\'packer\').status()'
cmd 'silent! command PackerSync lua require \'plugins\' require(\'packer\').sync()'
cmd 'silent! command PackerUpdate lua require \'plugins\' require(\'packer\').update()'

map('n', '<Leader>ps', ':PackerSync<CR>')
map('n', '<Leader>st', ':StartupTime<CR>')

return M
