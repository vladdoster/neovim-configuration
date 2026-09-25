return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
        -- trim.nvim sets ExtraWhitespace only once, so `:colorscheme` would clear it.
        on_highlights = function(hl) hl.ExtraWhitespace = { bg = '#ff0000', ctermbg = 'red' } end,
      }
      vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
