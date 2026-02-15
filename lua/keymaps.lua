api = vim.api
augroup = vim.api.nvim_create_augroup
autocmd = vim.api.nvim_create_autocmd
bo = vim.bo
cmd = vim.cmd
fn = vim.fn
g = vim.g
keymap = vim.keymap
lsp = vim.lsp
opt = vim.opt
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not g.vscode then opts.remap = nil end
  keymap.set(mode, lhs, rhs, opts)
end

g.mapleader = ' '

map('i', 'kk', '<Esc>')

map('n', '<leader>c', ':nohl<CR>')

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
-- map({"i", "x", "n", "s"}, "<leader>s", "<cmd>w<cr><esc>")
-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

map('n', '<C-n>', '<cmd>Neotree toggle reveal_force_cwd<CR>')

map('n', '<leader>O', '<cmd>Telescope git_files<CR>')
map('n', '<leader>a', '<cmd>Telescope<CR>')
map('n', '<leader>b', '<cmd>Telescope git_branches<CR>')
map('n', '<leader>f', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>')
map('n', '<leader>gr', '<cmd>Trouble lsp_references<CR>')
map('n', '<leader>i', '<cmd>Telescope jumplist<CR>')
map('n', '<leader>o', '<cmd>Telescope find_files<CR>')
map('n', '<leader>p', '<cmd>Telescope oldfiles<CR>')
map('n', '<leader>q', '<cmd>Telescope buffers<CR>')
map('n', '<leader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')
map('n', '<leader>x', '<cmd>TroubleToggle<CR>')

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { remap = true })
map('n', '<C-j>', '<C-w>j', { remap = true })
map('n', '<C-k>', '<C-w>k', { remap = true })
map('n', '<C-l>', '<C-w>l', { remap = true })

map('n', '<S-h>', '<cmd>bprevious<cr>')
map('n', '<S-l>', '<cmd>bnext<cr>')
map('n', '[b', '<cmd>bprevious<cr>')
map('n', ']b', '<cmd>bnext<cr>')

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>')
map('n', '<C-Down>', '<cmd>resize -2<cr>')
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>')
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>')

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==')
map('n', '<A-k>', '<cmd>m .-2<cr>==')
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi')
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi')
map('v', '<A-j>', ":m '>+1<cr>gv=gv")
map('v', '<A-k>', ":m '<-2<cr>gv=gv")

map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>')

-- quit
map('n', '<leader>qq', '<cmd>qa<cr>')
map('n', '<leader>W', '<cmd>wall<Cr>')
map('n', '<leader>w', '<cmd>update<cr>')

-- windows
map('n', '<leader>ww', '<C-W>p', { remap = true })
map('n', '<leader>wd', '<C-W>c', { remap = true })
map('n', '<leader>w-', '<C-W>s', { remap = true })
map('n', '<leader>w|', '<C-W>v', { remap = true })
map('n', '<leader>-', '<C-W>s', { remap = true })
map('n', '<leader>|', '<C-W>v', { remap = true })

map('n', '<leader><tab>l', '<cmd>tablast<cr>')
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>')
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>')
map('n', '<leader><tab>]', '<cmd>tabnext<cr>')
map('n', '<leader><tab>d', '<cmd>tabclose<cr>')
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>')

-- terminal mappings
map('t', '<esc><esc>', '<c-\\><c-n>')
map('t', '<C-h>', '<cmd>wincmd h<cr>')
map('t', '<C-j>', '<cmd>wincmd j<cr>')
map('t', '<C-k>', '<cmd>wincmd k<cr>')
map('t', '<C-l>', '<cmd>wincmd l<cr>')
map('t', '<C-/>', '<cmd>close<cr>')
map('t', '<c-_>', '<cmd>close<cr>')

map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
map('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
map('n', '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>')

-- map('n', "<C-s>", "<cmd>Sort<cr>")
-- map('n', "<C-s>sf", "<cmd>SortFolds<cr>")

map({ 'i', 'n', 's', 'v', 'x' }, '<C-s>', ':Sort<cr>')

-- vim: ts=2 sts=2 sw=2 et
