local luasnip_ok, luasnip = pcall(require, "luasnip")
if luasnip_ok then
    local types = require("luasnip.util.types")
    luasnip.config.setup({
        ext_opts = {
            [types.choiceNode] = { active = { virt_text = { { "●", "DiffAdd" } } } },
            [types.insertNode] = { active = { virt_text = { { "●", "DiffDelete" } } } },
        },
    })
    require("luasnip.loaders.from_vscode").lazy_load() -- Loading any vscode snippets from plugins
    local K = require("core.keymap") -- Mappins to move around inside snippets
    K.i("<C-j>", '<CMD>lua require("luasnip").jump(1)<CR>')
    K.i("<C-k>", '<CMD>lua require("luasnip").jump(-1)<CR>')
    K.s("<C-j>", '<CMD>lua require("luasnip").jump(1)<CR>')
    K.s("<C-k>", '<CMD>lua require("luasnip").jump(-1)<CR>')
end
