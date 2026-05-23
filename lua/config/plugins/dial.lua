return {
  spec = { src = 'https://github.com/monaqa/dial.nvim', name = 'dial.nvim' },
  lazy = {
    keys = {
      { '<C-a>', mode = 'n', expr = true },
      { '<C-x>', mode = 'n', expr = true },
    },
  },
  setup = function()
    local augend = require('dial.augend')
    require('dial.config').augends:register_group({
      default = {
        augend.constant.alias.bool,
        augend.integer.alias.decimal,
        augend.semver.alias.semver,
      },
    })
    vim.keymap.set('n', '<C-a>', function() return require('dial.map').inc_normal() end, { expr = true })
    vim.keymap.set('n', '<C-x>', function() return require('dial.map').dec_normal() end, { expr = true })
  end,
}
