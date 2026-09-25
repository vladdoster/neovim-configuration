return {
  'monaqa/dial.nvim',
  config = function()
    local augend = require('dial.augend')
    require('dial.config').augends:register_group({
      default = {
        augend.constant.alias.bool,
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
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
    {
      '<C-a>',
      mode = 'x',
      expr = true,
      function() return require('dial.map').inc_visual() end,
    },
    {
      '<C-x>',
      mode = 'x',
      expr = true,
      function() return require('dial.map').dec_visual() end,
    },
    {
      'g<C-a>',
      mode = 'x',
      expr = true,
      function() return require('dial.map').inc_gvisual() end,
    },
    {
      'g<C-x>',
      mode = 'x',
      expr = true,
      function() return require('dial.map').dec_gvisual() end,
    },
  },
}
