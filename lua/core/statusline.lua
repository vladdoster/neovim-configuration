local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup{
  options={
    always_divide_middle=true,
    component_separators='',
    globalstatus=true,
    icons_enabled=false,
    refresh={statusline=1000, tabline=1000, winbar=1000},
    section_separators='',
    theme='auto'
  },
  sections={
    lualine_a={'filename'},
    lualine_b={'branch', 'diff', 'diagnostics'},
    lualine_c={},
    lualine_x={'progress', 'location'},
    lualine_y={'encoding', 'fileformat', 'filetype'},
    lualine_z={'mode'}
  },
  tabline={lualine_a={'tabs'}, lualine_b={'buffers'}},
  extensions={'neo-tree'}
}
