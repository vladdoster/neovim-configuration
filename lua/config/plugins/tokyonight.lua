return {
  spec = { src = 'https://github.com/folke/tokyonight.nvim', name = 'tokyonight.nvim' },
  priority = 1000,
  setup = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup({
      styles = { comments = { italic = false } },
    })
    vim.cmd.colorscheme('tokyonight-night')
  end,
}
-- vim: ts=2 sts=2 sw=2 et
