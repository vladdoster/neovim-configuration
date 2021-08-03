local M = {}

local cmd = vim.cmd
local g = vim.g

function M.lspkind()
	local present, lspkind = pcall(require, "lspkind")
	if present then
		lspkind.init()
	end
end

function M.neoformat()
	g.neoformat_only_msg_on_error = 1
	g.neoformat_basic_format_align = 1
	g.neoformat_basic_format_retab = 1
	g.neoformat_basic_format_trim = 1

	g.neoformat_enabled_javascript = {"prettier"}
	g.neoformat_enabled_json = {"prettier"}
	g.neoformat_enabled_lua = {"luaformat"}
	g.neoformat_enabled_python = {"black"}
	g.neoformat_enabled_yaml = {"prettier"}
	g.neoformat_lua_luaformat = {exe = "lua-format"}
	g.neoformat_yaml_prettier = {
		exe = "prettier",
		args = {"--stdin-filepath", '"%:p"', "--tab-width=2"},
		stdin = 1
	}
end

return M
