local M = {}

M.luasnip = function()
    local is_ok, luasnip = pcall(require, 'luasnip')
    if is_ok then
        luasnip.config.set_config {
            history=true,
            updateevents='TextChanged,TextChangedI'
        }
        require('luasnip/loaders/from_vscode').load()
    end
end

M.autopairs = function()
    local present_0, autopairs = pcall(require, 'nvim-autopairs')
    local present_1, cmp_autopairs = pcall(
                                         require,
                                         'nvim-autopairs.completion.cmp')
    if (present_0 and present_1) then
        autopairs.setup()
        require('cmp').event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
end

M.material = function()
    local present, _ = pcall(require, 'material')
    if present then
        vim.g.material_style = 'darker'
        vim.cmd [[colorscheme material]]
    end
end

return M
