-- Sort
require('sort').setup()

local function map(m, k, v) vim.keymap.set(m, k, v, {silent=true}) end
map('v', '<C-s>', ':Sort<cr>')
