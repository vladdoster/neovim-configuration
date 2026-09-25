-- [[ Options ]]
--  See `:help vim.o` and `:help lua-options-guide`
--
--  Single alphabetized block on purpose: this file used to carry a second, partial
--  copy of these settings above, and the lower one silently won every conflict.

-- Sync clipboard between OS and Neovim.
--  Scheduled after `UiEnter` because setting it eagerly probes the clipboard
--  provider and increases startup-time. Do not also set this synchronously.
--  See `:help 'clipboard'`
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

vim.o.autowrite = true
vim.o.background = 'dark'
vim.o.breakindent = true
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.conceallevel = 3
-- Raise a dialog instead of failing on `:q` with unsaved changes.
vim.o.confirm = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.fixeol = false
vim.o.formatoptions = 'jqlnt'
vim.o.grepformat = '%f:%l:%c:%m'
vim.o.grepprg = 'rg --vimgrep'
vim.o.ignorecase = true
vim.o.inccommand = 'nosplit'
vim.o.laststatus = 3
vim.o.list = true
-- `vim.opt` rather than `vim.o`: it accepts tables. See `:help 'listchars'`
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
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
vim.o.wildmode = 'longest:full,full'
vim.o.winminwidth = 5
vim.o.wrap = false

local disabled_built_ins = {
  'bugreport',
  'compiler',
  'ftplugin',
  'getscript',
  'getscriptPlugin',
  'gzip',
  'logipat',
  'matchit',
  'netrw',
  'netrwPlugin',
  'optwin',
  'rplugin',
  'rrhelper',
  'spellfile_plugin',
  'synmenu',
  'tar',
  'tarPlugin',
  'tohtml',
  'tutor',
  'vimball',
  'vimballPlugin',
  'zip',
  'zipPlugin',
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end

-- vim: ts=2 sts=2 sw=2 et
