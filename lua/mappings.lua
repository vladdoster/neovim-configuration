local opt = {}
local noremap_nosilent = {noremap = true, silent = false}
local noremap_silent = {noremap = true, silent = true}

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
-- disable keys
map("n", "Q", "<Nop>", opt)
map("n", "<Left>", "<Nop>", opt)
map("n", "<Right>", "<Nop>", opt)
map("n", "<Up>", "<Nop>", opt)
map("n", "<Down>", "<Nop>", opt)
map("n", "<C-z>", "<Nop>", opt)
-- don't copy the replaced text after pasting in visual mode
map("v", "p", '"_dP', opt)
-- move line up or down
map("v", "J", ":move '>+1<CR>gv-gv")
map("v", "K", ":move '<-2<CR>gv-gv")
-- copy whole file content
map("n", "<C-a>", ":%y+<cr>", opt)
-- turn off search highlighting
map("n", "<Esc>", ":noh<cr>", opt)
-- format code
map("n", "<Leader>fm", ":Format<cr>", opt)
-- resize window
map("n", "<A-Left>", "<cmd>vertical resize +5<cr>", noremap_silent)
map("n", "<A-Up>", "<cmd>resize -5<cr>", noremap_silent)
map("n", "<A-Right>", "<cmd>vertical resize -5<cr>", noremap_silent)
map("n", "<A-Down>", "<cmd>resize +5<cr>", noremap_silent)
-- split navigation
map('n', '<C-h>', '<C-w>h', opt)
map('n', '<C-j>', '<C-w>j', opt)
map('n', '<C-k>', '<C-w>k', opt)
map('n', '<C-l>', '<C-w>l', opt)
-- move between tabs
map("n", "<TAB>", ":BufferLineCycleNext<cr>", opt)
map("n", "<S-TAB>", ":BufferLineCyclePrev<cr>", opt)
-- terminal mode
map("t", "<Esc>", "<C-\\><C-n>", opt)
-- NVIMTREE
map("n", "<Leader>n", ":NvimTreeToggle<cr>", noremap_silent)
-- TOGGLETERM
map("n", "<Leader>t", ":ToggleTerm direction=vertical size=80<cr>", opt)
-- TELESCOPE
map("n", "<Leader>fw", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opt)
map("n", "<Leader>gt", "<cmd>lua require('telescope.builtin').git_status()<cr>", opt)
map("n", "<Leader>cm",  "<cmd>lua require('telescope.builtin').git_commits()<cr>", opt)
map("n", "<Leader>ff",  "<cmd>lua require('telescope.builtin').find_files()<cr>", opt)
