require('colorizer').setup(nil, {
  RGB = true,
  RRGGBB = true,
  RRGGBBAA = true,
  css = true,
  css_fn = true,
  hsl_fn = true,
  mode = 'background',
  names = true,
  rgb_fn = true,
})

vim.cmd [[autocmd ColorScheme * lua package.loaded['colorizer'] = nil; require('colorizer').setup(); require('colorizer').attach_to_buffer(0)]]
