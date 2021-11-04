local present, cmp = pcall(require, 'cmp')
local lspkind = require('lspkind')

if not present then return end

cmp.setup {
    comparators={
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require'cmp-under-comparator'.under,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order
    },
    completion={completeopt='menu,menuone,noinsert'},
    formatting={format=lspkind.cmp_format({with_text=true, maxwidth=50})},
    documentation={border={'╭', '─', '╮', '│', '╯', '─', '╰', '│'}},
    experimental={ghost_text=true},
    mapping={
        ['<C-p>']=cmp.mapping.select_prev_item(),
        ['<C-n>']=cmp.mapping.select_next_item(),
        ['<C-d>']=cmp.mapping.scroll_docs(-4),
        ['<C-f>']=cmp.mapping.scroll_docs(4),
        ['<C-Space>']=cmp.mapping.complete(),
        ['<C-e>']=cmp.mapping.close(),
        ['<CR>']=cmp.mapping.confirm {
            behavior=cmp.ConfirmBehavior.Replace,
            select=true
        },
        ['<Tab>']=function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require('luasnip').expand_or_jumpable() then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes(
                        '<Plug>luasnip-expand-or-jump', true, true, true), '')
            else
                fallback()
            end
        end,
        ['<S-Tab>']=function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require('luasnip').jumpable(-1) then
                vim.fn.feedkeys(
                    vim.api.nvim_replace_termcodes(
                        '<Plug>luasnip-jump-prev', true, true, true), '')
            else
                fallback()
            end
        end
    },
    snippet={expand=function(args) require('luasnip').lsp_expand(args.body) end},
    sources={
        {name='nvim_lsp'},
        {name='luasnip'},
        {name='buffer'},
        {name='nvim_lua'},
        {name='path'}
    }
}
