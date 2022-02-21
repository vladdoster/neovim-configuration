local ok, tabline = pcall(require, 'tabline_framework')
if not ok then return end
local toys = require 'tabline_framework.toys'
toys.setup_tab_buffers()
local render = function(f)
  f.add '  '
  f.make_bufs(
    function(info)
      f.add(' ' .. info.buf .. ' ')
      f.add(info.filename or '[no name]')
      f.add(info.modified and '+')
      f.add ' '
    end, toys.get_tab_buffers(0)
  )
  f.add_spacer()
  f.make_tabs(function(info) f.add(' ' .. info.index .. ' ') end)
end
tabline.setup {render = render}
