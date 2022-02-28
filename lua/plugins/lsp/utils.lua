local K = require("core.keymap")
local U = {}
function U.fmt_on_save(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
            augroup FORMATTING
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
        ]])
	end
end
function U.capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").update_capabilities(capabilities)
end
---@param client table
---@see https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Avoiding-LSP-formatting-conflicts
function U.disable_formatting(client)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end
---@param bufnr number
function U.mappings(bufnr)
	K.n.bmap(bufnr, "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
	K.n.bmap(bufnr, "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
	K.n.bmap(bufnr, "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
	K.n.bmap(bufnr, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
	K.n.bmap(bufnr, "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
	K.i.bmap(bufnr, "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
	K.n.bmap(bufnr, "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>")
	K.n.bmap(bufnr, "<leader>c", "<cmd>lua vim.lsp.buf.code_action()<CR>")
	K.n.bmap(bufnr, "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
	K.n.bmap(bufnr, "[g", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
	K.n.bmap(bufnr, "]g", "<cmd>lua vim.diagnostic.goto_next()<CR>")
	K.n.bmap(bufnr, "<leader>so", [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
end
function U.get_luajit_path()
	local luajit_path = vim.split(package.path, ";")
	table.insert(luajit_path, "lua/?.lua")
	table.insert(luajit_path, "lua/?/init.lua")
	return luajit_path
end
function U.get_nvim_rtp_path()
	return { os.getenv("VIMRUNTIME") }
end
return U
