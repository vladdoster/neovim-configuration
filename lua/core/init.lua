local ok, impatient = pcall(require, 'impatient')
if not ok then
    impatient.enable_profile()
    require('packer_compiled')
end
for _, module in ipairs({'options', 'autocmds', 'mappings'}) do
    local ok, err = pcall(require, 'core.' .. module)
    if not ok then error('Error loading ' .. module .. '\n\n' .. err) end
end


