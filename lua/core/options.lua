local M = {}
local cmd = vim.cmd
local indent = 2
local opt, buf_opt = vim.opt, vim.bo

buf_opt.expandtab = true -- Use spaces instead of tabs
buf_opt.shiftwidth = indent -- Size of an indent
buf_opt.smartindent = true -- Insert indents automatically
buf_opt.undofile = true

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

opt.autowrite = true -- enable auto write
opt.clipboard = 'unnamedplus' -- sync with system clipboard
opt.concealcursor = 'n' -- Hide * markup for bold and italic
opt.conceallevel = 2 -- Hide * markup for bold and italic
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.guifont = 'IBM Plex Mono Regular Font:h14'
opt.hidden = true -- Enable modified buffers in background
opt.ignorecase = true -- Ignore case
opt.inccommand = 'split' -- preview incremental substitute
opt.joinspaces = false -- No double spaces with join after a dot
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = 'a' -- enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = {'buffers', 'curdir', 'tabpages', 'winsize'}
opt.shiftround = true -- Round indent
opt.shiftwidth = indent -- Size of an indent
opt.showmode = false -- dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = indent -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.wrap = false -- Disable line wrap
-- don't load following plugins
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
cmd([[autocmd FileType markdown nnoremap gO <cmd>Toc<cr>]])
cmd([[autocmd FileType markdown setlocal spell]])
cmd('au FocusGained * :checktime') -- Check if we need to reload the file when it changed
cmd( -- show cursor line only in active window
  [[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]]
)
-- -- go to last loc when opening a buffer
-- cmd([[autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]])
-- cmd('au TextYankPost * lua vim.highlight.on_yank {}') -- Highlight on yank
-- vim.opt.shadafile = 'NONE'
-- vim.schedule(
--   function()
--     vim.opt.shadafile = vim.opt.shadafile
--     vim.cmd [[ silent! rsh ]]
--   end
-- )
return M
