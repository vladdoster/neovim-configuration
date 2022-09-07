local ok_0, ts_utils = pcall(require, 'nvim-treesitter.ts_utils')
local ok_1, lsp_signature = pcall(require, 'lsp_signature')
local ok_2, navic = pcall(require, 'nvim-navic')
local ok_3, telescope_lsp = pcall(require, 'telescope.lsp')
local ok_4, aerial = pcall(require, 'aerial')
if not ok_0 or not ok_1 or not ok_2 or not ok_3 or not ok_4 then return end

local function highlight_references()
  local node = ts_utils.get_node_at_cursor()
  while node ~= nil do
    local type = node:type()
    if type == 'string' or type == 'string_fragment' or type == 'template_string' or type == 'document' then
      -- who wants to highlight a string? i don't. yuck
      return
    end
    node = node:parent()
  end
  vim.lsp.buf.document_highlight()
end

--- @return fun() @function that calls the provided fn, but with no args
local function w(fn) return function() return fn() end end

---@param bufnr number
local function buf_autocmd_document_highlight(bufnr)
  local group = vim.api.nvim_create_augroup('lsp_document_highlight', {})
  vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {buffer=bufnr, group=group, callback=highlight_references})
  vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'},
                              {buffer=bufnr, group=group, callback=w(vim.lsp.buf.clear_references)})
end

---@param bufnr number
local function buf_autocmd_codelens(bufnr)
  local group = vim.api.nvim_create_augroup('lsp_document_codelens', {})
  vim.api.nvim_create_autocmd({'BufEnter', 'InsertLeave', 'BufWritePost', 'CursorHold'},
                              {buffer=bufnr, group=group, callback=w(vim.lsp.codelens.refresh)})
end

-- Finds and runs the closest codelens (searches upwards only)
local function find_and_run_codelens()
  local bufnr = vim.api.nvim_get_current_buf()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lenses = vim.lsp.codelens.get(bufnr)
  lenses = vim.tbl_filter(function(lense) return lense.range.start.line < row end, lenses)
  if #lenses == 0 then return vim.api.nvim_echo({{'Could not find codelens to run.', 'WarningMsg'}}, false, {}) end
  table.sort(lenses, function(a, b) return a.range.start.line > b.range.start.line end)
  vim.api.nvim_win_set_cursor(0, {lenses[1].range.start.line + 1, lenses[1].range.start.character})
  vim.lsp.codelens.run()
  vim.api.nvim_win_set_cursor(0, {row, col}) -- restore cursor, TODO: also restore position
end

local function buf_set_keymaps(bufnr)
  local function buf_set_keymap(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, {buffer=bufnr, silent=true}) end

  buf_set_keymap('n', '<leader>p', vim.lsp.buf.format)
  -- Code actions
  buf_set_keymap('n', '<leader>r', vim.lsp.buf.rename)
  buf_set_keymap('n', '<space>f', vim.lsp.buf.code_action)
  buf_set_keymap('v', '<space>f', vim.lsp.buf.range_code_action)
  buf_set_keymap('n', '<leader>l', find_and_run_codelens)
  -- Movement
  buf_set_keymap('n', 'gD', vim.lsp.buf.declaration)
  buf_set_keymap('n', 'gd', telescope_lsp.definitions)
  buf_set_keymap('n', 'gr', telescope_lsp.references)
  buf_set_keymap('n', 'gbr', telescope_lsp.buffer_references)
  buf_set_keymap('n', 'gI', telescope_lsp.implementations)
  -- Docs
  buf_set_keymap('n', '<M-p>', vim.lsp.buf.signature_help)
  buf_set_keymap('i', '<M-p>', vim.lsp.buf.signature_help)
  buf_set_keymap('n', '<C-p>ws', telescope_lsp.workspace_symbols)
  buf_set_keymap('n', '<C-p>wd', telescope_lsp.workspace_diagnostics)
end

return function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  buf_set_keymaps(bufnr)
  if client.config.flags then client.config.flags.allow_incremental_sync = true end
  if client.supports_method 'textDocument/documentHighlight' then buf_autocmd_document_highlight(bufnr) end
  if client.supports_method 'textDocument/codeLens' then
    buf_autocmd_codelens(bufnr)
    vim.schedule(vim.lsp.codelens.refresh)
  end
  lsp_signature.on_attach({bind=true, floating_window=false, hint_prefix='', hint_scheme='Comment'})
  aerial.on_attach(client, bufnr)
end
