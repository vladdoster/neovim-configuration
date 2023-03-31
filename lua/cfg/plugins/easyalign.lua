-- EasyAlign
local function map(m, k, v) vim.keymap.set(m, k, v, {silent=true}) end

map('v', '<C-a>', [[<CMD>EasyAlign*\]])
