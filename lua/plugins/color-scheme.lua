local plugin_ok, material = pcall(require, "material")
if plugin_ok then
    vim.g.material_style = 'deep ocean'
    material.setup({
      contrast = {sidebars = true, cursor_line = true},
      disable  = {borders  = true, eob_lines   = true},
      italics  = {comments = true, functions   = true},
      lualine_style = 'stealth'
    })
    vim.cmd'colorscheme material' -- activate the colorscheme
end
