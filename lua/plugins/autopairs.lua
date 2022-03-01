local M = {}

function M.config()
	local ok_0, autopairs = pcall(require, "nvim-autopairs")
	local ok_1, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
	local ok_2, cmp = pcall(require, "cmp")
	if ok_0 and ok_1 and ok_2 then
		autopairs.setup({
			enable_check_bracket_line = true,
			ignored_next_char = "[%w%.]",
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0, -- Offset from pattern match
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})
		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done({
				map_char = { tex = "" },
			})
		)
	end
end
return M
