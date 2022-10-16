-- Set <space> as the leader key (see `:help mapleader`)
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
local keymap = vim.keymap.set
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
keymap({'n', 'v'}, '<Space>', '<Nop>', {silent=true})
-- Remap for dealing with word wrap
keymap('n', 'k', 'v:count == 0 ? \'gk\' : \'k\'', {expr=true, silent=true})
keymap('n', 'j', 'v:count == 0 ? \'gj\' : \'j\'', {expr=true, silent=true})
-- ╭──────────────╮
-- │ INSERT ⮕ 'i' │
-- ╰──────────────╯
-- Quick normal mode
keymap('n', '<left>', '<C-w>h')
keymap('n', '<down>', '<C-w>j')
keymap('n', '<up>', '<C-w>k')
keymap('n', '<right>', '<C-w>l')
-- ╭──────────────╮
-- │ NORMAL ⮕ 'n' │
-- ╰──────────────╯
local function search(backward)
  vim.cmd([[echo "1> "]])
  local first = vim.fn.getcharstr()
  vim.fn.search(first, 's' .. (backward and 'b' or ''))
  vim.schedule(function()
    vim.cmd([[echo "2> "]])
    local second = vim.fn.getcharstr()
    vim.fn.search(first .. second, 'c' .. (backward and 'b' or ''))

    vim.fn.setreg('/', first .. second)
  end)
end

keymap('n', 's', search)
keymap('n', 'S', function() search(true) end)
-- neotree
keymap('n', '<C-a>', '<cmd>Neotree reveal left<cr>')
keymap('n', '<C-b>', '<cmd>Neotree toggle show buffers right<cr>')
keymap('n', '<C-n>', '<cmd>Neotree toggle left<cr>')
-- aerial
keymap('n', '<leader>s', '<cmd>AerialToggle<CR>')
-- buffer navigation
keymap('n', '<C-w>e', '<cmd>tab split<cr>')
keymap('n', '<C-x>', '<cmd>bd<cr>')
keymap('n', '<S-h>', ':bprevious<cr>')
keymap('n', '<S-l>', ':bnext<cr>')
-- Clear search with <esc>
keymap('n', '<Esc>', '<cmd>:noh<cr>')
-- Disable ex mode
keymap('n', 'Q', '<Nop>')
-- Disable command-line window
keymap('n', 'q:', '<Nop>')
keymap('n', 'q/', '<Nop>')
keymap('n', 'q?', '<Nop>')
-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<leader>e', vim.diagnostic.open_float)
keymap('n', '<leader>q', vim.diagnostic.setloclist)
-- Quickly enter substitution mode
keymap('n', '<leader>/', ':%s/')
keymap('n', '<leader>?', ':%S/')
keymap('v', '<leader>/', ':s/')
keymap('v', '<leader>?', ':S/')

keymap('n', 'gw', '*N')
keymap('x', 'gw', '*N')
-- +───────────+
-- │ telescope │
-- +───────────+
keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
keymap('n', '<leader>ff', '<cmd>Telescope find_files {previewer=false}<cr>')
keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
keymap('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>')
keymap('n', '<leader>fw', '<cmd>Telescope live_grep<cr>')
keymap('n', '<leader>gb', '<cmd>Telescope git_branches<cr>')
keymap('n', '<leader>gc', '<cmd>Telescope git_commits<cr>')
keymap('n', '<leader>ld', '<cmd>Telescope diagnostics<cr>')
keymap('n', '<leader>lr', '<cmd>Telescope lsp_references<cr>')
keymap('n', '<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>')
keymap('n', '<leader>p', '<cmd>Telescope project<cr>')
keymap('n', '<leader>sc', '<cmd>Telescope commands<cr>')
keymap('n', '<leader>sk', '<cmd>Telescope keymaps<cr>')
keymap('n', '<leader>sm', '<cmd>Telescope man_pages<cr>')
keymap('n', '<leader>sn', '<cmd>Telescope notifications<cr>')
keymap('n', '<leader>sr', '<cmd>Telescope registers<cr>')
-- keymap('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
-- keymap('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
-- keymap('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer]' })

-- keymap('n', '<leader>sf', require('telescope.builtin').find_files, {desc='[S]earch [F]iles'})
-- keymap('n', '<leader>sh', require('telescope.builtin').help_tags, {desc='[S]earch [H]elp'})
-- keymap('n', '<leader>sw', require('telescope.builtin').grep_string, {desc='[S]earch current [W]ord'})
-- keymap('n', '<leader>sg', require('telescope.builtin').live_grep, {desc='[S]earch by [G]rep'})
-- keymap('n', '<leader>sd', require('telescope.builtin').diagnostics, {desc='[S]earch [D]iagnostics'})
-- +──────────+
-- │ terminal │
-- +──────────+
keymap('n', '<C-\\>', '<cmd>ToggleTerm<cr>')
keymap('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>')
keymap('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>')
keymap('n', '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>')
-- Navigation
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h')
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j')
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k')
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l')
-- +─────────+
-- │ windows │
-- +─────────+
-- Navigation
keymap('n', '<C-h>', '<C-w>h')
keymap('n', '<C-j>', '<C-w>j')
keymap('n', '<C-k>', '<C-w>k')
keymap('n', '<C-l>', '<C-w>l')
-- Resize windows with arrows
keymap('n', '<S-Up>', '<cmd>resize +2<CR>')
keymap('n', '<S-Down>', '<cmd>resize -2<CR>')
keymap('n', '<S-Left>', '<cmd>vertical resize -2<CR>')
keymap('n', '<S-Right>', '<cmd>vertical resize +2<CR>')
-- ╭──────────────╮
-- │ VISUAL ⮕ 'v' │
-- ╰──────────────╯
-- Move text up and down
keymap('i', '<A-j>', '<Esc>:m .+1<CR>==gi')
keymap('i', '<A-k>', '<Esc>:m .-2<CR>==gi')

keymap('n', '<A-j>', ':m .+1<CR>==')
keymap('n', '<A-k>', ':m .-2<CR>==')

keymap('v', '<A-j>', ':m \'>+1<CR>gv=gv')
keymap('v', '<A-k>', ':m \'<-2<CR>gv=gv')
keymap('v', '<A-j>', ':m .+1<CR>==')
keymap('v', '<A-k>', ':m .-2<CR>==')
-- Persistent indent mode
keymap('v', '<', '<gv')
keymap('v', '>', '>gv') --
-- Sort
keymap('v', '<C-s>', ':Sort<cr>')
keymap('v', 'p', '"_dP')
-- ╭────────────────────╮
-- │ VISUAL BLOCK ⮕ 'x' │
-- ╰────────────────────╯
-- move text up and down
keymap('x', 'J', ':move \'>+1<CR>gv-gv')
keymap('x', 'K', ':move \'<-2<CR>gv-gv')
keymap('x', '<A-j>', ':move \'>+1<CR>gv-gv')
keymap('x', '<A-k>', ':move \'<-2<CR>gv-gv')
