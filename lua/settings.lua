require "helpers/globals"

cmd [[filetype plugin on]]
cmd [[autocmd FileType * setlocal formatoptions-=cro]]

opt.autowrite = true
opt.background = 'dark'
opt.clipboard = 'unnamedplus'
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 3
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fixeol = false
opt.formatoptions = 'jcroqlnt'
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg'
opt.ignorecase = true
opt.inccommand = 'nosplit'
opt.laststatus = 0
opt.list = true
opt.mouse = 'a'
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 4
opt.sessionoptions = {'buffers', 'curdir', 'tabpages', 'winsize'}
opt.shiftround = true
opt.shiftwidth = 2
opt.shortmess:append{W = true, I = true, c = true}
opt.showmatch = true
opt.showmode = false
opt.sidescrolloff = 8
opt.signcolumn = 'yes'
opt.smartcase = true
opt.smartindent = true
if vim.fn.has("nvim-0.10") == 1 then opt.smoothscroll = true end
opt.spelllang = {'en'}
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.wildmenu = true
opt.wildmode = 'longest:full,full'
opt.winminwidth = 5
opt.wrap = false

local disabled_built_ins = {
  '2html_plugin', 'bugreport', 'compiler', 'ftplugin', 'getscript', 'getscriptPlugin', 'gzip',
  'logipat', 'matchit', 'netrw', 'netrwFileHandlers', 'netrwPlugin', 'netrwSettings', 'optwin',
  'rplugin', 'rrhelper', 'spellfile_plugin', 'synmenu', 'tar', 'tarPlugin', 'tutor', 'vimball',
  'vimballPlugin', 'zip', 'zipPlugin'
}

for _, plugin in pairs(disabled_built_ins) do g['loaded_' .. plugin] = 1 end

-- vim:tabstop=2 shiftwidth=2 expandtab syntax=lua
