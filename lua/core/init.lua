local present, impatient = pcall(require, 'impatient') -- load impatient first
vim.g.shell = '/bin/zsh'
local disabled_built_ins = {
    '2html_plugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logipat',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'matchit',
    'tar',
    'tarPlugin',
    'rrhelper',
    'spellfile_plugin',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin'
}
for _, plugin in pairs(disabled_built_ins) do vim.g['loaded_' .. plugin] = 1 end
for _, module in ipairs({
    'core.utils',
    'core.options',
    'core.mappings',
    'packer_compiled'
}) do pcall(require, module) end
