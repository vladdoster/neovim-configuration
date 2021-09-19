local utils = require "core.utils"
local map = utils.map
local cmd = vim.cmd
local M = {}

M.misc = function()
    local function non_config_mappings()
        map("v", "p", '"_dP')
        map("", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
        map("", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
        map("", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { expr = true })
        map("", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { expr = true })
        map("n", "<Esc>", ":noh <CR>")
    end

    local function optional_mappings()
        map({ "n", "v" }, "x", '"_x')
        map({ "n", "v" }, "dd", '"_dd')
        map("i", "<C-a>", "<ESC>^i")
    end

    local function required_mappings()
        map("n", "<C-a>", ":%y+ <CR>") -- copy whole file content
        map("n", "<S-t>", ":enew <CR>") -- new buffer
        map("n", "<C-s>", ":w <CR>") -- ctrl + s to save file

        -- move lines up || down
        map("v", "J", ":move '>+1<CR>gv-gv")
        map("v", "K", ":move '<-2<CR>gv-gv")

        -- better indenting
        map("v", ">", ">gv")
        map("v", "<", "<gv")

        map("t", "<Esc>", "<C-\\><C-n>") -- escape terminal

        map("n", "<C-h>", "<C-w>h")
        map("n", "<C-l>", "<C-w>l")
        map("n", "<C-k>", "<C-w>k")
        map("n", "<C-j>", "<C-w>j")

        -- Add Packer commands because we are not loading it at startup
        cmd "silent! command PackerClean lua require 'plugins' require('packer').clean()"
        cmd "silent! command PackerCompile lua require 'plugins' require('packer').compile()"
        cmd "silent! command PackerInstall lua require 'plugins' require('packer').install()"
        cmd "silent! command PackerStatus lua require 'plugins' require('packer').status()"
        cmd "silent! command PackerSync lua require 'plugins' require('packer').sync()"
        cmd "silent! command PackerUpdate lua require 'plugins' require('packer').update()"
    end

    non_config_mappings()
    optional_mappings()
    required_mappings()
end

-- M.bufferline = function()
--     map("n", "<TAB>", ":BufferLineCycleNext <CR>")
--     map("n", "<S-TAB>", ":BufferLineCyclePrev <CR>")
--     map("n", "<C-h>", "<C-w>h")
--     map("n", "<C-l>", "<C-w>l")
--     map("n", "<C-k>", "<C-w>k")
--     map("n", "<C-j>", "<C-w>j")
-- end

M.comment = function()
    map("n", "<leader>/", ":CommentToggle <CR>")
    map("v", "<leader>/", ":CommentToggle <CR>")
end

M.nvimtree = function()
    map("n", "<C-n>", ":NvimTreeToggle <CR>")
    map("n", "<leader>e", ":NvimTreeFocus <CR>")
end

M.neoformat = function()
    map("n", "<leader>fm", ":Neoformat <CR>")
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
