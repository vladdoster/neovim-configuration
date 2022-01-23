local M = {}
M.colorizer = function()
    local present, colorizer = pcall(require, 'colorizer')
    if present then
        colorizer.setup({'*'}, {
            RGB=true, -- #RGB hex codes
            RRGGBB=true, -- #RRGGBB hex codes
            mode='foreground' -- Set the display mode.
        })
        vim.cmd 'ColorizerReloadAllBuffers'
    end
end
M.luasnip = function()
    local present, luasnip = pcall(require, 'luasnip')
    if not present then return end
    luasnip.config.set_config {history=true, updateevents='TextChanged,TextChangedI'}
    require('luasnip/loaders/from_vscode').load()
end
M.signature = function()
    local present, lspsignature = pcall(require, 'lsp_signature')
    if present then
        lspsignature.setup {
            bind=true,
            doc_lines=2,
            floating_window=true,
            hint_enable=true,
            hint_prefix=' ',
            hint_scheme='String',
            hi_parameter='Search',
            max_height=22,
            max_width=120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
            handler_opts={
                border='single' -- double, single, shadow, none
            },
            zindex=200 -- by default it will be on top of all floating windows, set to 50 send it to bottom
        }
    end
end
return M
