local M = {}
M.autopairs = function()
    local present1, autopairs = pcall(require, 'nvim-autopairs')
    local present2, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
    if present1 and present2 then
        autopairs.setup()
        local cmp = require 'cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
end
M.comment_box = function()
    local present, comment_box = pcall(require, 'comment-box')
    if present then
        comment_box.setup({
            borders={
                horizontal='-',
                vertical='|',
                top_left='+',
                top_right='+',
                bottom_left='+',
                bottom_right='+'
            },
            inner_blank_lines=false, -- insert a blank line above and below the text
            line_symbol='-', -- symbol used to draw a line
            outer_blank_lines=false, -- insert a blank line above and below the box
            width=30
        })
       vim.keymap.set({'n', 'v'}, '<Leader>bb', comment_box.cbox, {})
    end
end
M.luasnip = function()
    local present, luasnip = pcall(require, 'luasnip')
    if present then
        luasnip.config.set_config {history=true, updateevents='TextChanged,TextChangedI'}
        require('luasnip/loaders/from_vscode').load {paths={}}
        require('luasnip/loaders/from_vscode').load()
    end
end
return M
