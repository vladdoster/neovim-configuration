vim.keymap.set('n', '<leader>x', '<CMD>lua require("Buffers").only()<CR>')
vim.keymap.set('n', '<leader>X', '<CMD>lua require("Buffers").clear()<CR>')
vim.keymap.set('n', '<leader>q', '<CMD>lua require("Buffers").delete()<CR>')

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
