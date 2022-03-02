local M = {}
function M.setup()
	local lualine = require("lualine")
	local colors = {
		bg = "#202328",
		black = "#000000",
		fg = "#bbc2cf",
		green = "#20C20E",
		orange = "#FF8800",
		red = "#ec5f67",
		yellow = "#ECBE7B",
	}
	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
	}
	local config = {
		options = {
			component_separators = "",
			section_separators = "",
			theme = {
				normal = { c = { fg = colors.green, bg = colors.bg } },
				inactive = { c = { fg = colors.fg, bg = colors.bg } },
			},
		},
		sections = { lualine_a = {}, lualine_b = {}, lualine_y = {}, lualine_z = {}, lualine_c = {}, lualine_x = {} },
		inactive_sections = {
			lualine_a = {},
			lualine_v = {},
			lualine_y = {},
			lualine_z = {},
			lualine_c = {},
			lualine_x = {},
		},
	}
	local function ins_left(component)
		table.insert(config.sections.lualine_c, component)
	end
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end
	ins_left({
		function()
			local function format_file_size(file)
				local size = vim.fn.getfsize(file)
				if size <= 0 then
					return ""
				end
				local i, sufixes = 1, { "b", "k", "m", "g" }
				while size > 1024 do
					size = size / 1024
					i = i + 1
				end
				return string.format("%.1f%s", size, sufixes[i])
			end
			local file = vim.fn.expand("%:p")
			if string.len(file) == 0 then
				return ""
			end
			return format_file_size(file)
		end,
		condition = conditions.buffer_not_empty,
	})
	ins_left({ "filename", condition = conditions.buffer_not_empty })
	ins_left({ "location" })
	ins_left({
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = { error = "E: ", warn = "W: ", info = "I: " },
		color_error = colors.red,
		color_warn = colors.yellow,
		color_info = colors.cyan,
	})
	ins_left({
		function()
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return ""
			end
			local client_names = {}
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					client_names[client.name] = true
				end
			end
			if next(client_names) then
				local names = ""
				for k, _ in pairs(client_names) do
					if names == "" then
						names = k
					else
						names = names .. ", " .. k
					end
				end
				return 'LSP: '..names
			end
			return
		end,
	})
	ins_right({ "o:encoding" })
	ins_right({
		"diff",
		symbols = { added = "+", modified = "~", removed = "-" },
		color_added = colors.green,
		color_modified = colors.yellow,
		color_removed = colors.red,
	})
	lualine.setup(config)
end
return M
