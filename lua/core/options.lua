local g, opt = vim.g, vim.opt
g.loaded_gzip = 1
g.loaded_fzf = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zipPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
-- Ignore compiled files
opt.formatoptions = opt.formatoptions - 'a' -- Auto formatting is BAD.
- 't' -- Don't auto format my code. I got linters for that.
+ 'c' -- In general, I like it when comments respect textwidth
+ 'q' -- Allow formatting comments w/ gq
- 'o' -- O and o, don't continue comments
+ 'r' -- But do continue when pressing enter.
+ 'n' -- Indent past the formatlistpat, not underneath it.
+ 'j' -- Auto-remove comments if possible.
- '2' -- I'm not in gradeschool anymore
local settings = {
  backup = false,
  clipboard = 'unnamedplus',
  cmdheight = 2,
  completeopt = {'menuone', 'noselect'},
  conceallevel = 0,
  cursorline = true,
  expandtab = true,
  fileencoding = 'utf-8',
  hlsearch = true,
  ignorecase = true,
  inccommand = 'split',
  mouse = 'a',
  number = true,
  numberwidth = 4,
  pumblend = 17,
  pumheight = 10,
  relativenumber = false,
  scrolloff = 8,
  shada = {'!', '\'1000', '<50', 's10', 'h'},
  shiftwidth = 2,
  showmode = false,
  showtabline = 2,
  sidescrolloff = 8,
  signcolumn = 'yes',
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 400,
  undofile = true,
  updatetime = 300,
  wildignore = '__pycache__',
  wildmode = 'longest:full',
  wrap = false,
  writebackup = false
}
vim.opt.shortmess:append 'c'
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'
for key, value in pairs(settings) do vim.opt[key] = value end
