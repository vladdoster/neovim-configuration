vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'lazy-bootstrap'
require('lazy').setup 'plugins'
require 'keybindings'
require 'settings'
require 'autocmds'

--  vim: set expandtab filetype=lua shiftwidth=4 tabstop=4 :
