local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then return end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then return end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end

require("luasnip/loaders/from_vscode").lazy_load()
local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup {
    confirm_opts = {behavior = cmp.ConfirmBehavior.Replace, select = false},
    documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
    },
    experimental = {ghost_text = false, native_menu = false},
    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = ({
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                luasnip = '[LuaSnip]',
                nvim_lua = '[Lua]',
                latex_symbols = '[Latex]'
            })
        })
    },
    mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {"i", "c"}),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {"i", "c"}),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        },
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm {select = true},
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})
    },
    snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
    sources = {
        {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"},
        {name = "path"}
    }
}
