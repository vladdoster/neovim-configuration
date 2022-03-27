local plugin_ok, material = pcall(require, 'material')
if not plugin_ok then
    vim.cmd([[colorscheme default]])
else
    vim.g.material_style = 'deep ocean'
    material.setup({})
    vim.cmd('colorscheme material') -- activate the colorscheme
end
return
