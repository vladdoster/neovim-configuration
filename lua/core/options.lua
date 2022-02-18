local M = {}
local cmd = vim.cmd
local indent = 2

vim.bo.expandtab = true -- Use spaces instead of tabs
vim.bo.shiftwidth = indent -- Size of an indent
vim.bo.smartindent = true -- Insert indents automatically
vim.bo.undofile = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.opt.autowrite = true -- enable auto write
vim.opt.clipboard = 'unnamedplus' -- sync with system clipboard
vim.opt.concealcursor = 'n' -- Hide * markup for bold and italic
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic
vim.opt.confirm = true -- confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.grepformat = '%f:%l:%c:%m'
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.guifont = 'FiraCode Nerd Font:h12'
vim.opt.hidden = true -- Enable modified buffers in background
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = 'split' -- preview incremental substitute
vim.opt.joinspaces = false -- No double spaces with join after a dot
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.mouse = 'a' -- enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.sessionoptions = {'buffers', 'curdir', 'tabpages', 'winsize'}
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = indent -- Size of an indent
vim.opt.showmode = false -- dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = indent -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- save swap file and trigger CursorHold
vim.opt.wildmode = 'longest:full,full' -- Command-line completion mode
vim.opt.wrap = false -- Disable line wrap
-- don't load the plugins below
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
  'lua', -- "vim",
  'json',
  'typescript',
  'javascript',
  'js=javascript',
  'ts=typescript',
  'shell=sh',
  'python',
  'sh',
  'console=sh'
}
vim.g.markdown_fenced_languages = fences
cmd([[autocmd FileType markdown nnoremap gO <cmd>Toc<cr>]])
cmd([[autocmd FileType markdown setlocal spell]])
cmd('au FocusGained * :checktime') -- Check if we need to reload the file when it changed
-- show cursor line only in active window
cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])
-- go to last loc when opening a buffer
cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]])
cmd('au TextYankPost * lua vim.highlight.on_yank {}') -- Highlight on yank
vim.opt.shadafile = 'NONE'
vim.schedule(function()
  vim.opt.shadafile = vim.opt.shadafile
  vim.cmd[[ silent! rsh ]]
end)
return M
