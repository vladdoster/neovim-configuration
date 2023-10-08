-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------
-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim
local status_ok, ibl = pcall(require, 'ibl')
if not status_ok then
  return
end
local highlight = {'CursorColumn', 'Whitespace'}

ibl.setup{
  indent={highlight=highlight, char=''},
  whitespace={highlight=highlight, remove_blankline_trail=false},
  scope={enabled=false}
}
