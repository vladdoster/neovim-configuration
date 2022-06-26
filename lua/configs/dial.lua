local status_ok, augend = pcall(require, 'dial.augend')
if not status_ok then return end
require('dial.config').augends:register_group{default={augend.constant.alias.bool, augend.integer.alias.decimal}}
