local M = {}
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not (cmp_status_ok and snip_status_ok) then return end
local opts = {
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace, select = true},
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end
    },
    documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
        winhighlight = 'FloatBorder:FloatBorder,Normal:Normal'
    },
    experimental = {ghost_text = false, native_menu = false},
    completion = {keyword_length = 1},
    sources = cmp.config.sources({
        {name = 'nvim_lsp'}, {name = 'nvim_lua'}, {name = 'buffer'}, {name = 'luasnip'}, {name = 'path'}
    })
}
vim.cmd([[
  autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
]])
cmp.setup(opts)
cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})
return M
