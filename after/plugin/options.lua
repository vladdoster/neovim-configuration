vim.opt.shortmess:append{s=true, I=true} -- disable startup message
--  Disable built-in vim plugins {{{
local default_plugins = {
  '2html_plugin',
  'bugreport',
  'compiler',
  'ftplugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'matchit',
  'netrw',
  'netrwFileHandlers',
  'netrwPlugin',
  'netrwSettings',
  'optwin',
  'rplugin',
  'rrhelper',
  'spellfile_plugin',
  'synmenu',
  'syntax',
  'tar',
  'tarPlugin',
  'tutor',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin'
}

for _, plugin in pairs(default_plugins) do vim.g['loaded_' .. plugin] = 1 end
-- }}}
-- Options {{{
local indent = 2

vim.notify = function(...)
  local args = {...}
  vim.defer_fn(function() vim.notify(unpack(args)) end, 300)
end

if vim.fn.has('nvim-0.8') == 1 then
  --   vim.opt.spell = true -- Put new windows below current
  vim.opt.cmdheight = 0
  -- make all keymaps silent by default
  local keymap_set = vim.keymap.set
  vim.keymap.set = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    return keymap_set(mode, lhs, rhs, opts)
  end
elseif vim.fn.has('nvim-0.9') == 1 then
  vim.opt.splitkeep = 'screen'
end

vim.o.autowrite = true -- enable auto write
vim.o.backspace = 'indent,eol,start'
vim.o.backup = false
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 2
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.concealcursor = 'nc' -- Hide * markup for bold and italic
vim.o.conceallevel = 3 -- Hide * markup for bold and italic
vim.o.confirm = true -- confirm to save changes before exiting modified buffer
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.errorbells = false
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.grepformat = '%f:%l:%c:%m'
vim.o.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.o.guifont = 'BlexMono Nerd Font Mono:h20'
vim.o.hidden = true
vim.o.hlsearch = true
vim.o.ignorecase = false
vim.o.inccommand = 'split' -- preview incremental substitute
vim.o.incsearch = true
vim.o.joinspaces = false -- No double spaces with join after a dot
vim.o.laststatus = 3
vim.o.list = true -- Show some invisible characters (tabs...
vim.o.mouse = 'a' -- enable mouse mode
vim.o.number = true -- Print line number
vim.o.pumblend = 10 -- Popup blend
vim.o.pumheight = 10 -- Maximum number of entries in a popup
vim.o.relativenumber = true -- Relative line numbers
vim.o.ruler = true
vim.o.scrolloff = 4 -- Lines of context
vim.o.shiftround = true -- Round indent
vim.o.shiftwidth = indent -- Size of an indent
vim.o.showcmd = true
vim.o.showmode = false -- dont show mode since we have a statusline
vim.o.sidescrolloff = 8 -- Columns of context
vim.o.signcolumn = 'yes' -- Always show the signcolumn otherwise it would shift the text each time
vim.o.smartcase = true -- Don't ignore case with capitals
vim.o.smartindent = true -- Insert indents automatically
vim.o.splitbelow = true -- Put new windows below current
vim.o.splitright = true
vim.o.startofline = false
vim.o.swapfile = false
vim.o.tabstop = indent -- Number of spaces tabs count for
vim.o.termguicolors = true -- True color support
vim.o.title = true
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 200 -- save swap file and trigger CursorHold
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full' -- Command-line completion mode
vim.o.wrap = false -- Disable line wrap

vim.o.foldmethod = 'indent'
vim.o.foldlevelstart = 1000
vim.o.foldnestmax = 3
vim.o.foldminlines = 1

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false
-- }}}
-- Default language providers {{{
local default_providers = {'node', 'perl', 'ruby'}
for _, provider in ipairs(default_providers) do vim.g['loaded_' .. provider .. '_provider'] = 0 end
-- }}}
-- File extensions {{{
vim.filetype.add({extension={tf='hcl'}, pattern={['.*%.env.*']='sh', ['ignore$']='conf'}})
-- }}}

-- vim: set ft=lua fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
