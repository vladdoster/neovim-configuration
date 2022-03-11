local present, impatient = pcall(require, 'impatient')
if present then impatient.enable_profile() end
require('plugins')
require('keybinds')
require('settings')
require('autocmd')
