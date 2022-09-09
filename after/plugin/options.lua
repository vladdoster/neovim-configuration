local opt = vim.opt
local g = vim.g

vim.cmd.syntax {'on'}

opt.backspace = 'indent,eol,start'
opt.backup = false
opt.clipboard = 'unnamedplus'
opt.cmdheight = 2
opt.completeopt = 'menu,menuone,noselect'
opt.errorbells = false
opt.formatoptions:remove 'o'
opt.formatoptions:remove 't'
opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = false
opt.inccommand = 'split'
opt.incsearch = true
opt.laststatus = 3
opt.mouse = 'a'
opt.ruler = true
opt.scrolloff = 15
opt.showcmd = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.startofline = false
opt.swapfile = false
opt.title = true
opt.undofile = true
opt.updatetime = 500
opt.whichwrap:append '<>[]hl'
opt.wildmenu = true

vim.wo.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'
vim.wo.wrap = false

-- set cmdheight to 2
vim.api.nvim_create_autocmd({'WinScrolled'}, {pattern='*', command='set cmdheight=2'})

vim.filetype.add({extension={tf='hcl'}, pattern={['.*%.env.*']='sh', ['ignore$']='conf'}})

-- disable builtin vim plugins
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

for _, plugin in pairs(default_plugins) do g['loaded_' .. plugin] = 1 end

local default_providers = {'node', 'perl', 'python3', 'ruby'}

for _, provider in ipairs(default_providers) do vim.g['loaded_' .. provider .. '_provider'] = 0 end

-- vim: ft=lua sw=2 sts=2 et foldmarker=[,] foldmethod=marker
