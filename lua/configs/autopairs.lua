local M = {}

function M.config()
	local loaded_0, autopairs = pcall(require, "nvim-autopairs")
	local loaded_1, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
	local loaded_2, cmp = pcall(require, "cmp")
	if loaded_0 and loaded_1 and loaded_2 then
		autopairs.setup(default)
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
return M
