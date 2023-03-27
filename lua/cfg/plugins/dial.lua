local augend = require('dial.augend')
require('dial.config').augends:register_group{
  -- default augends used when no group name is specified
  default={
    augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
    augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    augend.date.alias['%Y/%m/%d'], -- date (2022/02/19, etc.)
    augend.constant.alias.bool -- boolean value (true <-> false)
  }
}

local map = vim.keymap.set
map('n', '<C-a>', require('dial.map').inc_normal(), {noremap=true})
map('n', '<C-x>', require('dial.map').dec_normal(), {noremap=true})
map('v', '<C-a>', require('dial.map').inc_visual(), {noremap=true})
map('v', '<C-x>', require('dial.map').dec_visual(), {noremap=true})
map('v', 'g<C-a>', require('dial.map').inc_gvisual(), {noremap=true})
map('v', 'g<C-x>', require('dial.map').dec_gvisual(), {noremap=true})

-- vim: set fenc=utf8 ffs=unix ft=lua list noet sw=2 ts=2 tw=72:
