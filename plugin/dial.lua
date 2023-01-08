local ok, dial = pcall(require, 'dial.augend')
if not ok then return end
require("dial.config").augends:register_group{
  default = {
    dial.integer.alias.decimal,   -- nonnegative decimal number (0, 1, 2, 3, ...)
    dial.integer.alias.hex,       -- nonnegative hex number  (0x01, 0x1a1f, etc.)
    dial.date.alias["%Y/%m/%d"],  -- date (2022/02/20, etc.)
    dial.constant.alias.bool,    -- boolean value (true <-> false)
  },
}

vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), {noremap = true})
vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), {noremap = true})
vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), {noremap = true})
vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), {noremap = true})
vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), {noremap = true})
vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), {noremap = true})
