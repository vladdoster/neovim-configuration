local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local cmd = vim.cmd
local opt = {}

vim.g.mapleader = " "

-- toggle numbers
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- use ESC to turn off search highlighting
map("n", "<Esc>", ":noh<CR>", opt)

-- get out of terminal with jk
map("t", "jk", "<C-\\><C-n>", opt)

-- NvimTree
map("n", "<c-n>", ":RnvimrToggle<CR>", opt)

map("", "j", 'v:count ? "j" : "gj"', {expr = true})
map("", "k", 'v:count ? "k" : "gk"', {expr = true})
map("", "<Down>", 'v:count ? "j" : "gj"', {expr = true})
map("", "<Up>", 'v:count ? "k" : "gk"', {expr = true})

map("n", "<c-k>", [[<Cmd>wincmd k<CR>]], opt) -- ctrlhjkl to navigate splits
map("n", "<c-j>", [[<Cmd>wincmd j<CR>]], opt)
map("n", "<c-h>", [[<Cmd>wincmd h<CR>]], opt)
map("n", "<c-l>", [[<Cmd>wincmd l<CR>]], opt)

cmd([[autocmd BufWritePre * %s/\s\+$//e]]) -- remove trailing whitespaces
cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

-- compe stuff
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-n>")
    elseif check_back_space() then
        return t("<Tab>")
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t("<C-p>")
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t("<Plug>(vsnip-jump-prev)")
    else
        return t("<S-Tab>")
    end
end

function _G.completions()
    local npairs
    if not pcall(function() npairs = require("nvim-autopairs") end) then
        return
    end

    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

--  compe mappings
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("i", "<CR>", "v:lua.completions()", {expr = true})

-- Telescope
map("n", "<Leader>gt", [[<Cmd> Telescope git_status <CR>]], opt)
map("n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<Leader>.", [[<Cmd> Telescope find_files <CR>]], opt)
map("n", "<Leader>bb", [[<Cmd>Telescope buffers<CR>]], opt)
map("n", "<Leader>fh", [[<Cmd>Telescope help_tags<CR>]], opt)
map("n", "<Leader>fr", [[<Cmd>Telescope oldfiles<CR>]], opt)

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

-- Packer commands till because we are not loading it at startup
-- vim.cmd("silent! command PackerClean lua require 'plugin_list' require('packer').clean()")
-- vim.cmd("silent! command PackerCompile lua require 'plugin_list' require('packer').compile()")
-- vim.cmd("silent! command PackerInstall lua require 'plugin_list' require('packer').install()")
-- vim.cmd("silent! command PackerStatus lua require 'plugin_list' require('packer').status()")
-- vim.cmd("silent! command PackerSync lua require 'plugin_list' require('packer').sync()")
-- vim.cmd("silent! command PackerUpdate lua require 'plugin_list' require('packer').update()")
