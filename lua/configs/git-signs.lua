-- Gitsigns
require("gitsigns").setup({
	signs = {
		add = { hl = "GitGutterAdd", text = "+" },
		change = { hl = "GitGutterChange", text = "~" },
		delete = { hl = "GitGutterDelete", text = "_" },
		topdelete = { hl = "GitGutterDelete", text = "‾" },
		changedelete = { hl = "GitGutterChange", text = "~" },
	},
	numhl = false,
	linehl = false,
	keymaps = { noremap = true, buffer = true },
	watch_index = { interval = 1000 },
	sign_priority = 6,
	update_debounce = 200,
	status_formatter = nil,
	use_decoration_api = false,
})
