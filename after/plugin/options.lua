-- Set options {{{
local g, indent = vim.g, 2

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

vim.opt.autowrite = true          -- enable auto write
vim.opt.clipboard = 'unnamedplus' -- sync with system clipboard
vim.opt.concealcursor = "nc"      -- Hide * markup for bold and italic
vim.opt.conceallevel = 3          -- Hide * markup for bold and italic
vim.opt.confirm = true            -- confirm to save changes before exiting modified buffer
vim.opt.cursorline = true         -- Enable highlighting of the current line
vim.opt.expandtab = true          -- Use spaces instead of tabs

vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.guifont = 'FiraCode Nerd Font:h12'
vim.opt.hidden = true         -- Enable modified buffers in background
vim.opt.ignorecase = true     -- Ignore case
vim.opt.inccommand = 'split'  -- preview incremental substitute
vim.opt.joinspaces = false    -- No double spaces with join after a dot
vim.opt.list = true           -- Show some invisible characters (tabs...
vim.opt.mouse = 'a'           -- enable mouse mode
vim.opt.number = true         -- Print line number
vim.opt.pumblend = 10         -- Popup blend
vim.opt.pumheight = 10        -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 4         -- Lines of context
vim.opt.shiftround = true     -- Round indent
vim.opt.shiftwidth = indent   -- Size of an indent
vim.opt.showmode = false      -- dont show mode since we have a statusline
vim.opt.sidescrolloff = 8     -- Columns of context
vim.opt.signcolumn = 'yes'    -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true      -- Don't ignore case with capitals
vim.opt.smartindent = true    -- Insert indents automatically

vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.fillchars = {foldopen='', foldclose=''}
vim.opt.sessionoptions = {'buffers', 'curdir', 'tabpages', 'winsize'}
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- save swap file and trigger CursorHold
vim.opt.wildmode = 'longest:full,full' -- Command-line completion mode
vim.opt.wrap = false -- Disable line wrap
-- vim.o.shortmess = "IToOlxfitn"
-- }}}

-- Set file extensions {{{
-- vim.filetype.add({extension={tf='hcl'}, pattern={['.*%.env.*']='sh', ['ignore$']='conf'}})
-- }}}

--  Disable built-in vim plugins {{{
local default_plugins = {
  'gzip',
  'zip',
  'zipPlugin',
  'fzf',
  'tar',
  'tarPlugin',
  'getscript',
  'getscriptPlugin',
  'vimball',
  'vimballPlugin',
  '2html_plugin',
  'matchit',
  'matchparen',
  'logiPat',
  'rrhelper',
  'netrw',
  'netrwPlugin',
  'netrwSettings',
  'netrwFileHandlers'
}

for _, plugin in pairs(default_plugins) do g['loaded_' .. plugin] = 1 end
-- }}}

-- Set default langiage providers {{{
local default_providers = {'node', 'perl', 'python3', 'ruby'}
for _, provider in ipairs(default_providers) do vim.g['loaded_' .. provider .. '_provider'] = 0 end
-- }}}

-- Use proper syntax highlighting in code blocks {{{
local fences = {'console=sh', 'javascript', 'js=javascript', 'json', 'lua', 'python', 'sh', 'shell=sh'}
vim.g.markdown_fenced_languages = fences
-- }}}

-- vim: set ft=lua fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
