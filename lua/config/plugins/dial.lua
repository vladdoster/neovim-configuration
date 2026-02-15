return {
  'monaqa/dial.nvim',
  config = function()
    local augend = require('dial.augend')
    require('dial.config').augends:register_group({
      default = {
        augend.constant.alias.bool,
        augend.integer.alias.decimal,
        augend.semver.alias.semver,
      },
    })
  end,
  keys = {
    {
      '<C-a>',
      expr = true,
      function() return require('dial.map').inc_normal() end,
    },
    {
      '<C-x>',
      expr = true,
      function() return require('dial.map').dec_normal() end,
    },
  },
}
