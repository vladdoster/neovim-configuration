-- vim: set ft=lua fenc=utf-8 ts=2 sw=0 sts=0 sr et si tw=0 fdm=marker fmr={{{,}}}:
local opt = vim.opt
local g = vim.g

-- {{{ Set options
vim.cmd.syntax {'on'}

local options = -- Option list
{
  autoindent=true,
  compatible=false,
  cursorcolumn=false,
  cursorline=true,
  expandtab=true,
  foldlevel=0,
  foldmethod='marker',
  hidden=true,
  ignorecase=true,
  incsearch=true,
  linebreak=true,
  list=true,
  listchars='trail:·',
  modeline=true,
  mouse='a',
  number=true,
  relativenumber=true,
  scrolloff=5,
  shellcmdflag='-ic',
  shiftround=true,
  shiftwidth=0,
  showcmd=true,
  showmatch=true,
  showmode=false,
  signcolumn='yes',
  smartcase=true,
  smartindent=true,
  softtabstop=0,
  splitbelow=true,
  splitright=true,
  tabstop=4,
  termguicolors=true,
  textwidth=0,
  title=true,
  titlestring='%f',
  undofile=true,
  wrap=false
}

opt.clipboard:append('unnamedplus') -- Use system clipboard (REQUIRES xclip or wl-clipboard)
opt.iskeyword:append('-') -- Include the '-' character as a character from a word

for key, value in pairs(options) do opt[key] = value end
-- }}}

-- {{{ Set file extensions
vim.filetype.add({extension={tf='hcl'}, pattern={['.*%.env.*']='sh', ['ignore$']='conf'}})
-- }}}

-- {{{ Disable built-in vim plugins
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
-- }}}

-- {{{ Set default langiage providers
local default_providers = {'node', 'perl', 'python3', 'ruby'}
for _, provider in ipairs(default_providers) do vim.g['loaded_' .. provider .. '_provider'] = 0 end
-- }}}
