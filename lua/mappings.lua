local mode_adapters = {
    insert_mode = "i",
    normal_mode = "n",
    term_mode = "t",
    visual_mode = "v",
    visual_block_mode = "x"
}

local function load_mode(mode, keymaps, opts)
    mode = mode_adapters[mode] and mode_adapters[mode] or mode
    for _, keymap in ipairs(keymaps) do
        vim.api.nvim_set_keymap(mode, keymap[1], keymap[2], opts)
    end
end

local function load(keymaps, opts)
    for mode, mapping in pairs(keymaps) do
        M.load_mode(mode, mapping, opts[mode])
    end
end

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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

-- compe mappings
map("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
map("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
map("i", "<CR>", "v:lua.completions()", {expr = true})

local cmd = vim.cmd
local opt = {}

vim.g.mapleader = " "

local opts = {
    insert_mode = {noremap = true, silent = true},
    normal_mode = {noremap = true, silent = true},
    visual_mode = {noremap = true, silent = true},
    visual_block_mode = {noremap = true, silent = true},
    term_mode = {silent = true}
}

local keymaps = {
    insert_mode = {
        -- I hate escape
        {"jk", "<ESC>"}, {"kj", "<ESC>"}, {"jj", "<ESC>"},
        -- Move current line / block with Alt-j/k ala vscode.
        {"<A-j>", "<Esc>:m .+1<CR>==gi"}, {"<A-k>", "<Esc>:m .-2<CR>==gi"},
        -- navigation
        {"<A-Up>", "<C-\\><C-N><C-w>k"}, {"<A-Down>", "<C-\\><C-N><C-w>j"},
        {"<A-Left>", "<C-\\><C-N><C-w>h"}, {"<A-Right>", "<C-\\><C-N><C-w>l"}
    },

    normal_mode = {
        -- Better window movement
        {"<C-h>", "<C-w>h"}, {"<C-j>", "<C-w>j"}, {"<C-k>", "<C-w>k"},
        {"<C-l>", "<C-w>l"}, -- Resize with arrows
        {"<C-Up>", ":resize -2<CR>"}, {"<C-Down>", ":resize +2<CR>"},
        {"<C-Left>", ":vertical resize -2<CR>"},
        {"<C-Right>", ":vertical resize +2<CR>"},

        {"<Leader>fm", ":Neoformat<CR>"}, -- Tab switch buffer
        {"<TAB>", ":BufferLineCycleNext<CR>"}, {"<S-TAB>", ":BufferLineCycleNext<CR>"},

        -- NvimTree
        {"<C-n>", ":NvimTreeToggle<CR>"},

        -- Move current line / block with Alt-j/k a la vscode.
        {"<A-j>", ":m .+1<CR>=="}, {"<A-k>", ":m .-2<CR>=="}, -- QuickFix
        {"]q", ":cnext<CR>"}, {"[q", ":cprev<CR>"},
        {"<C-q>", ":call QuickFixToggle()<CR>"},

        -- {'<C-TAB>', 'compe#complete()', {noremap = true, silent = true, expr = true}},

        -- LSP
        {"gd", "<cmd>lua vim.lsp.buf.definition()<CR>"},
        {"gD", "<cmd>lua vim.lsp.buf.declaration()<CR>"},
        {"gr", "<cmd>lua vim.lsp.buf.references()<CR>"},
        {"gi", "<cmd>lua vim.lsp.buf.implementation()<CR>"}, {
            "gl",
            "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ show_header = false, border = 'single' })<CR>"
        }, {"gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>"},
        {"gp", "<cmd>lua require'lsp.peek'.Peek('definition')<CR>"},
        {"K", "<cmd>lua vim.lsp.buf.hover()<CR>"},
	},

    term_mode = {
        -- Terminal window navigation
        {"<C-h>", "<C-\\><C-N><C-w>h"}, {"<C-j>", "<C-\\><C-N><C-w>j"},
        {"<C-k>", "<C-\\><C-N><C-w>k"}, {"<C-l>", "<C-\\><C-N><C-w>l"}
    },

    visual_mode = {
        -- Better indenting
        {"<", "<gv"}, {">", ">gv"}

        -- { "p", '"0p', { silent = true } },
        -- { "P", '"0P', { silent = true } },
    },

    visual_block_mode = {
        -- Move selected line / block of text in visual mode
        {"K", ":move '<-2<CR>gv-gv"}, {"J", ":move '>+1<CR>gv-gv"},

        -- Move current line / block with Alt-j/k ala vscode.
        {"<A-j>", ":m '>+1<CR>gv-gv"}, {"<A-k>", ":m '<-2<CR>gv-gv"}
    }
}

for mode, mapping in pairs(keymaps) do load_mode(mode, mapping, opts[mode]) end
