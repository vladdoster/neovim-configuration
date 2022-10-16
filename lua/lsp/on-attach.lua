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

return function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then desc = 'LSP: ' .. desc end
    vim.keymap.set('n', keys, func, {buffer=bufnr, desc=desc})
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('gr', require('telescope.builtin').lsp_references)
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
       '[W]orkspace [L]ist Folders')
  -- :Format command local to LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, {desc='Format current buffer with LSP'})

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  if client.config.flags then client.config.flags.allow_incremental_sync = true end
  if client.supports_method 'textDocument/documentHighlight' then buf_autocmd_document_highlight(bufnr) end
  if client.supports_method 'textDocument/codeLens' then
    buf_autocmd_codelens(bufnr)
    vim.schedule(vim.lsp.codelens.refresh)
  end
  lsp_signature.on_attach({bind=true, floating_window=false, hint_prefix='', hint_scheme='Comment'})
  aerial.on_attach(client, bufnr)
end
