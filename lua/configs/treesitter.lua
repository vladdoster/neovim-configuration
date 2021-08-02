local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
	return
end

ts_config.setup({
	ensure_installed = {
		"bash",
		"dockerfile",
		"go",
		"gomod",
		"json",
		"lua",
		"python",
		"ruby",
		"toml",
		"yaml",
	},

	highlight = { enable = true, disable = { "bash" } },
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["ia"] = "@parameter.inner",
				-- ['af'] = '@function.outer',
				-- ['if'] = '@function.inner',
				-- ['ac'] = '@class.outer',
				-- ['ic'] = '@class.inner'
			},
		},
		move = {
			enable = true,
			goto_next_start = { ["]m"] = "@function.outer" },
			goto_next_end = { ["]M"] = "@function.outer", ["]f"] = "@function.outer" },
			goto_previous_start = { ["[m"] = "@function.outer", ["[f"] = "@function.outer" },
			goto_previous_end = { ["[M"] = "@function.outer" },
		},
	},
	matchup = { enable = false },
})
