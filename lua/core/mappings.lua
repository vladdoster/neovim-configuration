local M = {}
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local cmd = vim.cmd

M.misc = function()
    -- disable arrow keys
    map('', '<up>', '<nop>', {noremap = true})
    map('', '<down>', '<nop>', {noremap = true})
    map('', '<left>', '<nop>', {noremap = true})
    map('', '<right>', '<nop>', {noremap = true})

    map("n", "<Esc>", ":noh <CR>", opts)
    map("v", "p", '"_dP', opts)

    map("n", "x", '"_x', opts)
    map("v", "x", '"_x', opts)
    map("n", "dd", '"_dd', opts)
    map("v", "dd", '"_dd', opts)
    map("i", "<C-a>", "<ESC>^i", opts)

    map("n", "<C-a>", ":%y+ <CR>", opts) -- copy whole file content
    map("n", "<S-t>", ":enew <CR>", opts) -- new buffer
    map("v", "<C-s>", ":sort<CR>", opts)
    map('i', '<leader>s', '<C-c>:w<CR>', opts)
    map('n', '<leader>s', ':w<CR>', opts)
    -- move lines up || down
    map("v", "J", ":move '>+1<CR>gv-gv", opts)
    map("v", "K", ":move '<-2<CR>gv-gv", opts)
    -- better indenting
    map("v", ">", ">gv", opts)
    map("v", "<", "<gv", opts)
    -- move around splits using Ctrl + {h,j,k,l}
    map('n', '<C-h>', '<C-w>h', opts)
    map('n', '<C-j>', '<C-w>j', opts)
    map('n', '<C-k>', '<C-w>k', opts)
    map('n', '<C-l>', '<C-w>l', opts)

    map("t", "<Esc>", "<C-\\><C-n><C-w>w", opts)

    map("n", "<A-Up>", ":resize -2<CR>", opts)
    map("n", "<A-Down>", ":resize +2<CR>", opts)
    map("n", "<A-Right>", ":vertical resize -2<CR>", opts)
    map("n", "<A-Left>", ":vertical resize +2<CR>", opts)

    map("n", "<Leader>bn", ":bufdo bnext<CR>", opts)
    map("n", "<Leader>bp", ":bufdo bprevious<CR>", opts)
    map("n", "<Leader>bc", ":bufdo bdelete<CR>", opts)

    map('n', '<C-t>', ':Term<CR>', {noremap = true})

    map('n', '<C-n>', ':NvimTreeToggle<CR>', opts) -- open/close
    map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts) -- refresh
    map('n', '<leader>n', ':NvimTreeFindFile<CR>', opts) -- search file

    map("n", "<leader>fm", ":Neoformat<CR>", opts)

    cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
    cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
    cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
    cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
    cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
    cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

    map("n", "<Leader>ps", ":PackerSync<CR>", opts)
    map("n", "<Leader>st", ":StartupTime<CR>", opts)
end

M.telescope = function()
    map("n", "<leader>fb", ":Telescope buffers <CR>", opts)
    map("n", "<leader>ff", ":Telescope find_files <CR>", opts)
    map("n", "<leader>fa", ":Telescope find_files hidden=true <CR>", opts)
    map("n", "<leader>cm", ":Telescope git_commits <CR>", opts)
    map("n", "<leader>gt", ":Telescope git_status <CR>", opts)
    map("n", "<leader>fh", ":Telescope help_tags <CR>", opts)
    map("n", "<leader>fw", ":Telescope live_grep <CR>", opts)
    map("n", "<leader>fo", ":Telescope oldfiles <CR>", opts)
end

return M
