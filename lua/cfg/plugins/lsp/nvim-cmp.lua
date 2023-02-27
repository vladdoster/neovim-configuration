local cmp = require("cmp")
local icons = {
	Class = "ﴯ",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "",
	File = "",
	Folder = "",
	Function = "",
	Interface = "",
	Keyword = "",
	Method = "",
	Module = "",
	Operator = "",
	Property = "ﰠ",
	Reference = "",
	Snippet = "",
	Struct = "פּ",
	Text = "",
	TypeParameter = "",
	Unit = "塞",
	Value = "",
	Variable = "",
}
local aliases = { nvim_lsp = "lsp", luasnip = "snippet" }
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-e>"] = cmp.config.disable,
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp", max_item_count = 10 },
		{ name = "luasnip", max_item_count = 10 },
		{ name = "path", max_item_count = 10 },
		{ name = "buffer", max_item_count = 10 },
	}),
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, item)
			item.kind = string.format("%s %s", icons[item.kind], item.kind)
			item.menu = string.format("[%s]", aliases[entry.source.name] or entry.source.name)
			return item
		end,
	},
})