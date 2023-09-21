local M = {}

M.map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- better up/down
M.map({"n", "x"}, "j", "v:count == 0 ? 'gj' : 'j'", {expr=true, silent=true})
M.map({"n", "x"}, "k", "v:count == 0 ? 'gk' : 'k'", {expr=true, silent=true})
-- Move to window using the <ctrl> hjkl keys
M.map("n", "<C-h>", "<C-w>h", {remap=true})
M.map("n", "<C-j>", "<C-w>j", {remap=true})
M.map("n", "<C-k>", "<C-w>k", {remap=true})
M.map("n", "<C-l>", "<C-w>l", {remap=true})
-- Resize window using <ctrl> arrow keys
M.map("n", "<A-Up>", "<cmd>resize +2<cr>")
M.map("n", "<A-Down>", "<cmd>resize -2<cr>")
M.map("n", "<A-Left>", "<cmd>vertical resize -2<cr>")
M.map("n", "<A-Right>", "<cmd>vertical resize +2<cr>")
-- Move Lines
M.map("n", "<A-j>", "<cmd>m .+1<cr>==")
M.map("n", "<A-k>", "<cmd>m .-2<cr>==")
M.map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
M.map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
M.map("v", "<A-j>", ":m '>+1<cr>gv=gv")
M.map("v", "<A-k>", ":m '<-2<cr>gv=gv")

M.map("n", "<S-h>", "<cmd>bprevious<cr>")
M.map("n", "<S-l>", "<cmd>bnext<cr>")
M.map("n", "[b", "<cmd>bprevious<cr>")
M.map("n", "]b", "<cmd>bnext<cr>")
M.map("n", "<leader>bb", "<cmd>e #<cr>")
M.map("n", "<leader>`", "<cmd>e #<cr>")

-- Clear search with <esc>
M.map({"i", "n"}, "<esc>", "<cmd>noh<cr><esc>")

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
M.map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>")

M.map({"n", "x"}, "gw", "*N")
-- save file
M.map({"i", "v", "n", "s"}, "<C-s>", "<cmd>w<cr><esc>")

-- keywordprg
M.map("n", "<leader>K", "<cmd>norm! K<cr>")

-- better indenting
M.map("v", "<", "<gv")
M.map("v", ">", ">gv")
-- packer
M.map("n", "<leader>ps", "<cmd>PackerSync<cr>")
-- new file
M.map("n", "<leader>fn", "<cmd>new<cr>")
-- quit
M.map("n", "<leader>qq", "<cmd>q<cr>")
-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  M.map("n", "<leader>ui", vim.show_pos)
end
-- Terminal Mappings
M.map("t", "<esc><esc>", "<c-\\><c-n>")
M.map("t", "<C-h>", "<cmd>wincmd h<cr>")
M.map("t", "<C-j>", "<cmd>wincmd j<cr>")
M.map("t", "<C-k>", "<cmd>wincmd k<cr>")
M.map("t", "<C-l>", "<cmd>wincmd l<cr>")
M.map("t", "<C-/>", "<cmd>close<cr>")
M.map("t", "<c-_>", "<cmd>close<cr>")

-- windows
M.map("n", "<leader>ww", "<C-W>p", {remap=true})
M.map("n", "<leader>wd", "<C-W>c", {remap=true})
M.map("n", "<leader>w-", "<C-W>s", {remap=true})
M.map("n", "<leader>w|", "<C-W>v", {remap=true})
M.map("n", "<leader>-", "<C-W>s", {remap=true})
M.map("n", "<leader>|", "<C-W>v", {remap=true})
-- tabs
M.map("n", "<leader><tab>l", "<cmd>tablast<cr>")
M.map("n", "<leader><tab>f", "<cmd>tabfirst<cr>")
M.map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>")
M.map("n", "<leader><tab>]", "<cmd>tabnext<cr>")
M.map("n", "<leader><tab>d", "<cmd>tabclose<cr>")
M.map("n", "<leader><tab>[", "<cmd>tabprevious<cr>")
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", {expr=true})
map("x", "n", "'Nn'[v:searchforward]", {expr=true})
map("o", "n", "'Nn'[v:searchforward]", {expr=true})
map("n", "N", "'nN'[v:searchforward]", {expr=true})
map("x", "N", "'nN'[v:searchforward]", {expr=true})
map("o", "N", "'nN'[v:searchforward]", {expr=true})

M.map("v", "<C-s>", "<cmd>Sort<cr>", {remap=true})
-- save the current buffer or all buffers
M.map("n", "<leader>W", "<cmd>wall<Cr>")
M.map("n", "<leader>w", "<cmd>update<cr>")
vim.keymap.set("n", "<C-c>", "<cmd>normal! ciw<cr>a")

return M

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
