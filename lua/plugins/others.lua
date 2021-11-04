local M = {}

M.autopairs = function()
    local is_ok_0, autopairs = pcall(require, 'nvim-autopairs')
    local is_ok_1, autopairs_completion = pcall(
                                              require,
                                              'nvim-autopairs.completion.cmp')
    if (is_ok_0 or is_ok_1) then
        autopairs.setup()
        autopairs_completion.setup {map_complete=true, map_cr=true}
    end
end

M.luasnip = function()
    local is_ok, luasnip = pcall(require, 'luasnip')
    if not is_ok then
        luasnip.config.set_config {
            history=true,
            updateevents='TextChanged,TextChangedI'
        }
        require('luasnip/loaders/from_vscode').load()
    end
end

M.material = function()
    local present, _ = pcall(require, 'material')
    if present then
        vim.g.material_style = 'darker'
        vim.cmd [[colorscheme material]]
    end
end

M.signature = function()
    local present, lspsignature = pcall(require, 'lsp_signature')
    if present then
        lspsignature.setup {
            bind=true,
            doc_lines=0,
            fix_pos=true,
            floating_window=true,
            handler_opts={border='single'},
            hi_parameter='Search',
            hint_enable=true,
            hint_prefix=' ',
            hint_scheme='String',
            max_height=22,
            max_width=120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
            padding='', -- character to pad on left and right of signature can be ' ', or '|'  etc
            zindex=200 -- by default it will be on top of all floating windows, set to 50 send it to bottom
        }
    end
end
return M
