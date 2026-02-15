vim.o.number = true
-- vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.showmode = false
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

vim.cmd([[filetype plugin on]])
vim.cmd([[autocmd FileType * setlocal formatoptions-=cro]])

vim.o.autowrite = true
vim.o.background = 'dark'
vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.conceallevel = 3
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.fixeol = false
vim.o.formatoptions = 'jcroqlnt'
vim.o.grepformat = '%f:%l:%c:%m'
vim.o.grepprg = 'rg'
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.laststatus = 0
vim.o.list = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.pumblend = 10
vim.o.pumheight = 10
vim.o.relativenumber = true
vim.o.scrolloff = 4
vim.opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.o.showmatch = true
vim.o.showmode = false
vim.o.sidescrolloff = 8
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.smartindent = true
if vim.fn.has('nvim-0.10') == 1 then vim.o.smoothscroll = true end
vim.opt.spelllang = { 'en' }
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.updatetime = 200
vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'
vim.o.winminwidth = 5
vim.o.wrap = false

local disabled_built_ins = {
  '2html_plugin',
  'bugreport',
  'compiler',
  'ftplugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'matchit',
  'optwin',
  'rplugin',
  'rrhelper',
  'spellfile_plugin',
  'synmenu',
  'tar',
  'tarPlugin',
  'tutor',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

-- vim: set ft=lua:

-- vim: ts=2 sts=2 sw=2 et
