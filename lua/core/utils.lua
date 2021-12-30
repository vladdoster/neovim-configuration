local M = {}
M.map = function(mode, keys, cmd, opt)
    local options = {noremap=true, silent=true}
    if opt then options = vim.tbl_extend('force', options, opt) end
    -- all valid modes allowed for mappings
    -- :h map-modes
    local valid_modes = {
        ['']=true,
        ['n']=true,
        ['v']=true,
        ['s']=true,
        ['x']=true,
        ['o']=true,
        ['!']=true,
        ['i']=true,
        ['l']=true,
        ['c']=true,
        ['t']=true
    }
    -- helper function for M.map
    -- can gives multiple modes and keys
    local function map_wrapper(mode, lhs, rhs, options)
        if type(lhs) == 'table' then
            for _, key in ipairs(lhs) do map_wrapper(mode, key, rhs, options) end
        else
            if type(mode) == 'table' then
                for _, m in ipairs(mode) do map_wrapper(m, lhs, rhs, options) end
            else
                if valid_modes[mode] and lhs and rhs then
                    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
                else
                    mode, lhs, rhs = mode or '', lhs or '', rhs or ''
                    print(
                        'Cannot set mapping [ mode = \'' .. mode .. '\' | key = \'' .. lhs .. '\' | cmd = \'' .. rhs ..
                            '\' ]')
                end
            end
        end
    end
    map_wrapper(mode, keys, cmd, options)
end
return M
