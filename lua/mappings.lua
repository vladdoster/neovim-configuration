local opt = {}
local noremap_nosilent = { noremap = true, silent = false }
local noremap_silent = { noremap = true, silent = true }

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
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
-- copy whole file content
map("n", "<C-a>", ":%y+<CR>", opt)
-- turn off search highlighting
map("n", "<Esc>", ":noh<CR>", opt)
-- format code
map("n", "<Leader>fm", ":Neoformat<CR>", opt)
-- resize window
map("n", "<A-Left>", "<CMD>vertical resize +5<CR>", noremap_silent)
map("n", "<A-Up>", "<CMD>resize -5<CR>", noremap_silent)
map("n", "<A-Right>", "<CMD>vertical resize -5<CR>", noremap_silent)
map("n", "<A-Down>", "<CMD>resize +5<CR>", noremap_silent)
-- move between tabs
map("n", "<TAB>", ":BufferLineCycleNext<CR>", opt)
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opt)
-- terminal mode
map("t", "<Esc>", "<C-\\><C-n>", opt)
-- nvimtree
map("n", "<Leader>n", ":NvimTreeToggle<CR>", noremap_silent)
-- telescope
map("n", "<Leader>fw", ":Telescope live_grep<CR>", opt)
map("n", "<Leader>gt", ":Telescope git_status <CR>", opt)
map("n", "<Leader>cm", ":Telescope git_commits <CR>", opt)
map("n", "<Leader>ff", ":Telescope find_files <CR>", opt)
map("n", "<Leader>fp", ":Telescope media_files <CR>", opt)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opt)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opt)
map("n", "<Leader>fo", ":Telescope oldfiles<CR>", opt)
map("n", "<Leader>th", ":Telescope themes<CR>", opt)
