-- helper function
function config(plugin)
	require("configs." .. plugin)
end

-- General
require("plugins")
require("options")
require("key-bindings")
-- require("auto-commands")
require("colorschemes.onedark")
-- LSP and Autocomplete
config("auto-pairs")
config("compe")
config("git-signs")
config("lsp")
-- Terminal Support
config("toggle-term")
-- Syntax and Visual
config("colorizer")
config("dashboard")
config("lualine")
config("tree-sitter")
-- Navigation
config("nvim-tree")
config("telescope")
-- Other
config("auto-session")
config("dial")
config("formatting")
config("which-key")
