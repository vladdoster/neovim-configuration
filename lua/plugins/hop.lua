local K = require('keymap')

require('hop').setup()

K.n('<S-j>', '<CMD>HopWordAC<CR>')
K.n('<S-k>', '<CMD>HopWordBC<CR>')