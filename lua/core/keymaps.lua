-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end
-- Change leader to a comma
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')

-- save file
map({"i", "x", "n", "s"}, "<leader>s", "<cmd>w<cr><esc>", {desc="Save file"})
-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', {noremap=true}) -- open
map('t', '<Esc>', '<C-\\><C-n>') -- exit

-- better up/down
map({"n", "x"}, "j", "v:count == 0 ? 'gj' : 'j'", {expr=true, silent=true})
map({"n", "x"}, "k", "v:count == 0 ? 'gk' : 'k'", {expr=true, silent=true})

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", {remap=true})
map("n", "<C-j>", "<C-w>j", {remap=true})
map("n", "<C-k>", "<C-w>k", {remap=true})
map("n", "<C-l>", "<C-w>l", {remap=true})

map("n", "<S-h>", "<cmd>bprevious<cr>")
map("n", "<S-l>", "<cmd>bnext<cr>")
map("n", "[b", "<cmd>bprevious<cr>")
map("n", "]b", "<cmd>bnext<cr>")

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==")
map("n", "<A-k>", "<cmd>m .-2<cr>==")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")

map({"i", "n"}, "<esc>", "<cmd>noh<cr><esc>")

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>")
map("n", "<leader>W", "<cmd>wall<Cr>")
map("n", "<leader>w", "<cmd>update<cr>")

-- highlights under cursor
map("n", "<leader>ui", vim.show_pos)

-- windows
map("n", "<leader>ww", "<C-W>p", {remap=true})
map("n", "<leader>wd", "<C-W>c", {remap=true})
map("n", "<leader>w-", "<C-W>s", {remap=true})
map("n", "<leader>w|", "<C-W>v", {remap=true})
map("n", "<leader>-", "<C-W>s", {remap=true})
map("n", "<leader>|", "<C-W>v", {remap=true})

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>")
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>")
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>")
map("n", "<leader><tab>]", "<cmd>tabnext<cr>")
map("n", "<leader><tab>d", "<cmd>tabclose<cr>")
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>")
-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>")
map("t", "<C-h>", "<cmd>wincmd h<cr>")
map("t", "<C-j>", "<cmd>wincmd j<cr>")
map("t", "<C-k>", "<cmd>wincmd k<cr>")
map("t", "<C-l>", "<cmd>wincmd l<cr>")
map("t", "<C-/>", "<cmd>close<cr>")
map("t", "<c-_>", "<cmd>close<cr>")

map('n', "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
map('n', "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>")
map('n', "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>")

map('n', "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
map('n', "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>")
map('n', "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>")
