-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local keymap = vim.keymap

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  keymap.set(mode, lhs, rhs, opts)
end

-- Clear search highlight, in both normal and insert mode
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Clear search highlight' })

map('i', 'kk', '<Esc>', { desc = 'Exit insert mode' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- `<leader>ql`, not `<leader>q`: a bare mapping that is also the prefix of another
-- (`<leader>qq`) stalls for the full `timeoutlen` on every press while Neovim waits
-- to see if more keys are coming.
map('n', '<leader>ql', function() vim.diagnostic.setloclist() end, { desc = 'Open diagnostic [Q]uickfix [L]ist' })

-- Move Lines; a count moves them that many lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move line down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move line up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move line down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move line up' })
map('x', '<A-j>', [[:<C-u>execute "'<,'>move '>+" . v:count1<cr>gv=gv]], { desc = 'Move selection down' })
map('x', '<A-k>', [[:<C-u>execute "'<,'>move '<-" . (v:count1 + 1)<cr>gv=gv]], { desc = 'Move selection up' })

-- Sort (sQVe/sort.nvim)
map('x', '<C-s>', ':Sort<cr>', { desc = 'Sort selection' })

-- Move focus between windows with Ctrl+{h,j,k,l}
--  See `:help wincmd` for a list of all window commands
for _, dir in ipairs({
  { key = 'h', desc = 'left' },
  { key = 'j', desc = 'lower' },
  { key = 'k', desc = 'upper' },
  { key = 'l', desc = 'right' },
}) do
  map('n', '<C-' .. dir.key .. '>', '<C-w>' .. dir.key, { desc = 'Move focus to the ' .. dir.desc .. ' window' })
end

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Window layout / management
map('n', '<leader>wK', '<C-w>t<C-w>K', { desc = 'Change vertical split to horizontal' })
map('n', '<leader>wH', '<C-w>t<C-w>H', { desc = 'Change horizontal split to vertical' })
map('n', '<leader>ww', '<C-W>p', { desc = 'Go to previous window' })
map('n', '<leader>wd', '<C-W>c', { desc = 'Close window' })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below' })
map('n', '<leader>w|', '<C-W>v', { desc = 'Split window right' })
map('n', '<leader>-', '<C-W>s', { desc = 'Split window below' })
map('n', '<leader>|', '<C-W>v', { desc = 'Split window right' })
map('n', '<C-w>z', '<C-w>_<C-w>|', { desc = 'Zoom window' })

-- Tabs
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last tab' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First tab' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New tab' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next tab' })
map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close tab' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous tab' })

-- Buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })

-------------------------------------------------------------
-- Terminal settings
-----------------------------------------------------------
-- One shared shell. The horizontal and vertical toggles move it between layouts.
-- State lives on the buffer, so re-sourcing this file keeps the running shell.
local function shared_term_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.b[buf].shared_terminal then return buf end
  end
end

local function win_in_tab(buf)
  if not buf then return nil end
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_buf(win) == buf then return win end
  end
end

-- A nil layout hides an open terminal or reopens it in its last layout.
local function toggle_terminal(layout)
  local buf = shared_term_buf()
  local win = win_in_tab(buf)
  local last_layout = buf and vim.b[buf].shared_terminal_layout
  layout = layout or last_layout or 'vertical'

  if win and layout == last_layout then
    -- Neovim refuses to close the last window, so show another buffer in it.
    if #vim.api.nvim_tabpage_list_wins(0) == 1 then
      vim.cmd(vim.fn.buflisted(vim.fn.bufnr('#')) == 1 and 'buffer #' or 'enew')
    else
      vim.api.nvim_win_close(win, false)
    end
    return
  end

  if layout == 'vertical' then
    vim.cmd('botright vsplit')
    vim.api.nvim_win_set_width(0, math.floor(vim.o.columns * 0.4))
  else
    vim.cmd('botright split')
    vim.api.nvim_win_set_height(0, 15)
  end
  -- Close the old window after the split opens, so the old window is never the last one.
  if win then vim.api.nvim_win_close(win, false) end

  if buf then
    vim.api.nvim_win_set_buf(0, buf)
    vim.cmd.startinsert()
  else
    vim.cmd.terminal()
    buf = vim.api.nvim_get_current_buf()
    vim.bo[buf].buflisted = false
    vim.b[buf].shared_terminal = true
  end
  vim.b[buf].shared_terminal_layout = layout
end

vim.api.nvim_create_user_command('Term', function() toggle_terminal() end, { desc = 'Toggle terminal' })

-- Matches the WezTerm "Windows High Contrast (base16)" background. `default` lets a colorscheme override it.
local function set_terminal_hl() vim.api.nvim_set_hl(0, 'TerminalNormal', { bg = '#000000', default = true }) end
set_terminal_hl()

local term_group = vim.api.nvim_create_augroup('shared-terminal', { clear = true })

-- `:colorscheme` clears all highlight groups, so set the terminal group again.
vim.api.nvim_create_autocmd('ColorScheme', { group = term_group, callback = set_terminal_hl })

-- Neovim already turns off list, number and relativenumber in terminals.
vim.api.nvim_create_autocmd('TermOpen', {
  group = term_group,
  command = 'setlocal nocursorline | startinsert',
})

-- Give terminal windows the WezTerm background. BufWinEnter covers a hidden terminal shown in a new split.
vim.api.nvim_create_autocmd({ 'TermOpen', 'BufWinEnter' }, {
  group = term_group,
  pattern = 'term://*',
  command = 'setlocal winhighlight=Normal:TerminalNormal,NormalNC:TerminalNormal',
})

-- Delete the shared terminal when its shell exits, so the next toggle starts a new shell.
-- Neovim deletes it on exit status 0, so this covers a non-zero exit.
vim.api.nvim_create_autocmd('TermClose', {
  group = term_group,
  callback = function(ev)
    if not vim.api.nvim_buf_is_valid(ev.buf) or not vim.b[ev.buf].shared_terminal then return end
    vim.schedule(function()
      if vim.api.nvim_buf_is_valid(ev.buf) then vim.api.nvim_buf_delete(ev.buf, { force = true }) end
    end)
  end,
})

-- Leave insert mode when the cursor leaves a terminal buffer
vim.api.nvim_create_autocmd('BufLeave', {
  group = term_group,
  pattern = 'term://*',
  command = 'stopinsert',
})
-- Terminal mappings
-- No single <Esc> map: programs in the terminal (fzf, lazygit, vi-mode) need it.
map('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Exit terminal mode' })
-- <leader>tt, not <C-t>: <C-t> pops the tag stack after <C-]>.
map('n', '<leader>tt', '<cmd>Term<CR>', { desc = '[T]oggle [T]erminal' })
map('n', '<leader>th', function() toggle_terminal('horizontal') end, { desc = '[T]erminal [H]orizontal' })
map('n', '<leader>tv', function() toggle_terminal('vertical') end, { desc = '[T]erminal [V]ertical' })
-- File explorer

map('n', '<C-n>', '<cmd>Neotree toggle reveal<CR>', { desc = 'Toggle file explorer' })

-- Quit / save / reload
--  Saving lives on <leader>W alone. Bare <leader>s and <leader>w each prefixed a
--  larger namespace (Telescope's <leader>s* and the window <leader>w* set), so both
--  stalled for `timeoutlen` on every press to do what `:w` already does.
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })
map('n', '<leader>W', '<cmd>wall<Cr>', { desc = 'Write all buffers' })
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Map <leader>r to source the current Lua or Vim file',
  group = vim.api.nvim_create_augroup('source-current-file', { clear = true }),
  pattern = { 'lua', 'vim' },
  callback = function(ev)
    map('n', '<leader>r', '<cmd>source %<cr>', { buffer = ev.buf, desc = '[R]eload current file' })
  end,
})

-- Telescope quick-access (single-letter personal shortcuts; the mnemonic <leader>s*
-- set lives in lua/config/plugins/telescope.lua)
map('n', '<leader>O', '<cmd>Telescope git_files<CR>', { desc = 'Find git files' })
map('n', '<leader>a', '<cmd>Telescope<CR>', { desc = 'Telescope pickers' })
map('n', '<leader>b', '<cmd>Telescope git_branches<CR>', { desc = 'Git branches' })
map('n', '<leader>gd', '<cmd>Telescope lsp_definitions<CR>', { desc = 'Go to definition' })
map('n', '<leader>i', '<cmd>Telescope jumplist<CR>', { desc = 'Jumplist' })
map('n', '<leader>o', '<cmd>Telescope find_files<CR>', { desc = 'Find files' })
map('n', '<leader>p', '<cmd>Telescope oldfiles<CR>', { desc = 'Recent files' })
-- <leader>ts, not <leader>t: gitsigns and the LSP attach both add <leader>t* toggles.
map('n', '<leader>ts', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', { desc = 'Workspace symbols' })

-- vim: ts=2 sts=2 sw=2 et
