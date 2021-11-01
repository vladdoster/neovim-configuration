local o_s = vim.o
local g = vim.g

local function opt(o, v, scopes)
  scopes = scopes or {o_s}
  for _, s in ipairs(scopes) do s[o] = v end
end

local o, wo, bo = vim.o, vim.wo, vim.bo
-- LEADER/LOCAL LEADER
g.mapleader = [[ ]]
g.maplocalleader = [[,]]
-- SKIP LOADING MISC. REMOTE PROVIDERS
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
-- PYTHON LOCATION
g.python3_host_prog = '/usr/bin/python3'
-- DISABLE SOME BUILT-IN PLUGINS WE DON'T WANT
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}
for i = 1, 10 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end
-- COLORSCHEME
opt('termguicolors', true)
opt('background', 'dark')
-- SETTINGS
local buffer = { o, bo }
local window = { o, wo }
opt('concealcursor', 'nc', window)
opt('conceallevel', 2, window)
opt('cursorline', true, window)
opt('display', 'msgsep')
opt('expandtab', true, buffer)
opt('guicursor', [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
opt('hidden', true)
opt('ignorecase', true)
opt('inccommand', 'nosplit')
opt('joinspaces', false)
opt('laststatus', 2)
opt('lazyredraw', true)
opt('modeline', false, buffer)
opt('mouse', 'nivh')
opt('number', true, window)
opt('previewheight', 5)
opt('relativenumber', true, window)
opt('scrolloff', 7)
opt('shada', [['20,<50,s10,h,/100]])
opt('shiftwidth', 2, buffer)
opt('shortmess', o.shortmess .. 'c')
opt('showmatch', true)
opt('showmode', false)
opt('signcolumn', 'yes:1', window)
opt('smartcase', true)
opt('smartindent', true, buffer)
opt('softtabstop', 0, buffer)
opt('synmaxcol', 500, buffer)
opt('tabstop', 2, buffer)
opt('textwidth', 100, buffer)
opt('undofile', false, buffer)
opt('updatetime', 500)
opt('whichwrap', vim.o.whichwrap .. '<,>,h,l')
opt('wrap', false)
opt('wildignore', '*.o,*~,*.pyc')
opt('wildmode', 'longest,full')
