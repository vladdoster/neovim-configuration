local keymap = vim.keymap.set

keymap('n', '<A-t>', '<CMD>lua require(\'FTerm\').toggle()<CR>')
keymap('t', '<A-t>', '<C-\\><C-n><CMD>lua require(\'FTerm\').toggle()<CR>')
