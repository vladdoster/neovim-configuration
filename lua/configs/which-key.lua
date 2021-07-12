local mappings = {
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		r = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
	},
	t = {
		name = "Terminal",
		f = { "<cmd>lua require('lspsaga.floaterm').open_float_terminal()<cr>", "Floating Terminal" },
		t = { ":ToggleTerm<cr>", "Split Below" },
		l = { "<cmd>lua require('lspsaga.floaterm').open_float_terminal('lazygit')<cr>", "LazyGit" },
	},
	Q = { ":q!<cr>", "Force Quit" },
	W = { ":w!<cr>", "Force Write" },
	e = { ":NvimTreeToggle<cr>", "File Explorer" },
	h = { ":Dashboard<cr>", "Dashboard" },
	l = { i = { ":LspInfo", "Connected Language Servers" } },
	q = { ":q<cr>", "Quit" },
	w = { ":w<cr>", "Write" },
	x = { ":bdelete<cr>", "Close Buffer" },
	["/"] = { ":CommentToggle<cr>", "Toggle Comment" },
}

local opts = { prefix = "<leader>" }

local wk = require("which-key")
wk.register(mappings, opts)
