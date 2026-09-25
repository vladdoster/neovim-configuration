-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local g = vim.g
local keymap = vim.keymap

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap and not g.vscode then opts.remap = nil end
  keymap.set(mode, lhs, rhs, opts)
end

-- Clear search highlight, in both normal and insert mode
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>')
map('n', '<leader>c', ':nohl<CR>')

map('i', 'kk', '<Esc>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.hl_op()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.hl_op() end,
})

-- `<leader>ql`, not `<leader>q`: a bare mapping that is also the prefix of another
-- (`<leader>qq`) stalls for the full `timeoutlen` on every press while Neovim waits
-- to see if more keys are coming.
map('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix [L]ist' })

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==')
map('n', '<A-k>', '<cmd>m .-2<cr>==')
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi')
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi')
map('v', '<A-j>', ":m '>+1<cr>gv=gv")
map('v', '<A-k>', ":m '<-2<cr>gv=gv")

-- Sort (sQVe/sort.nvim)
map({ 'i', 'n', 's', 'v', 'x' }, '<C-s>', ':Sort<cr>')

-- Move focus between windows with Ctrl+{h,j,k,l}; also works from terminal mode.
--  See `:help wincmd` for a list of all window commands
for _, dir in ipairs({
  { key = 'h', desc = 'left' },
  { key = 'j', desc = 'lower' },
  { key = 'k', desc = 'upper' },
  { key = 'l', desc = 'right' },
}) do
  map(
    'n',
    '<C-' .. dir.key .. '>',
    '<C-w>' .. dir.key,
    { remap = true, desc = 'Move focus to the ' .. dir.desc .. ' window' }
  )
  map(
    't',
    '<C-' .. dir.key .. '>',
    '<cmd>wincmd ' .. dir.key .. '<cr>',
    { desc = 'Move focus to the ' .. dir.desc .. ' window' }
  )
end

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Window layout / management
map('n', '<leader>wK', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>wH', '<C-w>t<C-w>H') -- change horizontal to vertical
map('n', '<leader>ww', '<C-W>p', { remap = true })
map('n', '<leader>wd', '<C-W>c', { remap = true })
map('n', '<leader>w-', '<C-W>s', { remap = true })
map('n', '<leader>w|', '<C-W>v', { remap = true })
map('n', '<leader>-', '<C-W>s', { remap = true })
map('n', '<leader>|', '<C-W>v', { remap = true })

-- Tabs
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last tab' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First tab' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New tab' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous tab' })

-- Buffers
map('n', '<S-h>', '<cmd>bprevious<cr>')
map('n', '<S-l>', '<cmd>bnext<cr>')
map('n', '[b', '<cmd>bprevious<cr>')
map('n', ']b', '<cmd>bnext<cr>')

--
vim.keymap.set('n', '<C-w>z', '<C-w>_<C-w>|', { desc = 'Zoom window' })

-- Terminal
map('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Exit terminal mode' })
map('t', '<C-/>', '<cmd>close<cr>')
map('t', '<c-_>', '<cmd>close<cr>')

-- File explorer
map('n', '<C-n>', '<cmd>Neotree toggle reveal_force_cwd<CR>')

-- Quit / save / reload
--  Saving lives on <leader>W alone. Bare <leader>s and <leader>w each prefixed a
--  larger namespace (Telescope's <leader>s* and the window <leader>w* set), so both
--  stalled for `timeoutlen` on every press to do what `:w` already does.
map('n', '<leader>qq', '<cmd>qa<cr>')
map('n', '<leader>W', '<cmd>wall<Cr>')
map('n', '<leader>r', ':so %<CR>')

-- Telescope quick-access (single-letter personal shortcuts; the mnemonic <leader>s*
-- set lives in lua/config/plugins/telescope.lua)
map('n', '<leader>O', '<cmd>Telescope git_files<CR>')
map('n', '<leader>a', '<cmd>Telescope<CR>')
map('n', '<leader>b', '<cmd>Telescope git_branches<CR>')
map('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>')
map('n', '<leader>i', '<cmd>Telescope jumplist<CR>')
map('n', '<leader>o', '<cmd>Telescope find_files<CR>')
map('n', '<leader>p', '<cmd>Telescope oldfiles<CR>')
-- <leader>ts, not <leader>t: gitsigns and the LSP attach both add <leader>t* toggles.
map('n', '<leader>ts', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>')

-- vim: ts=2 sts=2 sw=2 et
