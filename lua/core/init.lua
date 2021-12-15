local ok, impatient = pcall(require, 'impatient')
if ok then impatient.enable_profile() end
for _, module in ipairs({'options', 'autocmds', 'mappings',}) do
    local ok, err = pcall(require, 'core.' .. module)
    if not ok then error('Error loading ' .. module .. '\n\n' .. err) end
end
pcall(require, 'packer_compiled')
