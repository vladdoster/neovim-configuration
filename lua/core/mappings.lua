local utils = require "core.utils"
local map = utils.map
local cmd = vim.cmd
local M = {}

M.misc = function()
    map("v", "p", '"_dP')
    map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
    map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
    map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
    map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
    map("n", "<Esc>", ":noh <CR>")

    map({ "n", "v" }, "x", '"_x')
    map({ "n", "v" }, "dd", '"_dd')
    map("i", "<C-a>", "<ESC>^i")

    map("n", "<C-a>", ":%y+ <CR>") -- copy whole file content
    map("n", "<S-t>", ":enew <CR>") -- new buffer
    map("n", "<C-s>", ":w <CR>") -- ctrl + s to save file
    map("v", "<C-s>", ":sort<CR>")

    -- move lines up || down
    map("v", "J", ":move '>+1<CR>gv-gv")
    map("v", "K", ":move '<-2<CR>gv-gv")

    -- better indenting
    map("v", ">", ">gv")
    map("v", "<", "<gv")

    map("n", "<C-h>", "<C-w>h")
    map("n", "<C-l>", "<C-w>l")
    map("n", "<C-k>", "<C-w>k")
    map("n", "<C-j>", "<C-w>j")
    map("t", "<Esc>", "<C-\\><C-n><C-w>w")

    map("n", "<A-Up>", ":resize -2<CR>")
    map("n", "<A-Down>", ":resize +2<CR>")
    map("n", "<A-Right>", ":vertical resize -2<CR>")
    map("n", "<A-Left>", ":vertical resize +2<CR>")

    map("n", "<Leader>bn", ":bufdo bnext<CR>")
    map("n", "<Leader>bp", ":bufdo bprevious<CR>")

    map("n", "<leader>fm", ":FormatWrite<CR>")
    map("n", "<C-n>", ":NvimTreeToggle<CR>")

    cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
    cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
    cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
    cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
    cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
    cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"

    map("n", "<Leader>ps", ":PackerSync<CR>")
    map("n", "<Leader>st", ":StartupTime<CR>")

end

M.telescope = function()
    map("n", "<leader>fb", ":Telescope buffers <CR>")
    map("n", "<leader>ff", ":Telescope find_files <CR>")
    map("n", "<leader>fa", ":Telescope find_files hidden=true <CR>")
    map("n", "<leader>cm", ":Telescope git_commits <CR>")
    map("n", "<leader>gt", ":Telescope git_status <CR>")
    map("n", "<leader>fh", ":Telescope help_tags <CR>")
    map("n", "<leader>fw", ":Telescope live_grep <CR>")
    map("n", "<leader>fo", ":Telescope oldfiles <CR>")
end

return M
