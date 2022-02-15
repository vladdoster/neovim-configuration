local utils = require 'core.utils'

utils.impatient()
utils.disabled_builtins()
utils.bootstrap()

local sources = {
    'core.options',
    'core.autocmds',
    'core.plugins',
    'core.mappings'
}

for _, source in ipairs(sources) do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
        error('Failed to load ' .. source .. '\n\n' .. fault)
    end
end

utils.compiled()
