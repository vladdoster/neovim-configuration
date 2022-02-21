local M = {}

local cmd = vim.cmd
local opt = vim.opt

vim.g.loaded_gzip = 1
vim.g.loaded_fzf = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
-- use proper syntax highlighting in code blocks
local fences = {
  'console=sh',
  'javascript',
  'js=javascript',
  'json',
  'lua',
  'python',
  'sh',
  'shell=sh',
  'ts=typescript',
  'typescript',
}
vim.g.markdown_fenced_languages = fences

vim.g.loaded_matchparen = 1
-- Ignore compiled files
opt.wildignore = '__pycache__'
opt.wildignore = opt.wildignore + {'*.o', '*~', '*.pyc', '*pycache*'}

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = 'longest:full'

opt.cmdheight = 1 -- Height of the command bar
opt.cursorline = true -- Highlight the current line
opt.equalalways = false -- I don't like my windows changing all the time
opt.hidden = true -- I like having buffers stay around
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.ignorecase = true -- Ignore case when searching...
opt.incsearch = true -- Makes search act like search in modern browsers
opt.number = true -- But show the actual number for the line we're on
opt.relativenumber = true -- Show line numbers
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor
opt.showcmd = true
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.showmode = false
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.splitright = true -- Prefer windows splitting to the right
opt.updatetime = 1000 -- Make updates happen faster
-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.foldmethod = 'marker'
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = 'all' -- Just turn the dang bell off

opt.clipboard = 'unnamedplus'

opt.inccommand = 'split'
opt.swapfile = false -- Living on the edge
opt.shada = {'!', '\'1000', '<50', 's10', 'h'}

opt.mouse = 'n'

opt.formatoptions = opt.formatoptions - 'a' -- Auto formatting is BAD.
- 't' -- Don't auto format my code. I got linters for that.
+ 'c' -- In general, I like it when comments respect textwidth
+ 'q' -- Allow formatting comments w/ gq
- 'o' -- O and o, don't continue comments
+ 'r' -- But do continue when pressing enter.
+ 'n' -- Indent past the formatlistpat, not underneath it.
+ 'j' -- Auto-remove comments if possible.
- '2' -- I'm not in gradeschool anymore

return M
