local cmd, g, opt = vim.cmd, vim.g, vim.opt
local indent = 2

--[[ vim.bo.expandtab = true -- Use spaces instead of tabs
vim.bo.shiftwidth = indent -- Size of an indent
vim.bo.smartindent = true -- Insert indents automatically
vim.bo.undofile = true ]]

vim.g.mapleader = " "
vim.g.maplocalleader = ","
opt.autowrite = true -- enable auto write
opt.clipboard = "unnamedplus" -- sync with system clipboard
opt.conceallevel = 2 -- Hide * markup for bold and italic
opt.concealcursor = "n" -- Hide * markup for bold and italic
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- TreeSitter folding
-- vim.opt.foldlevel = 6
-- vim.opt.foldmethod = "expr" -- TreeSitter folding
opt.guifont = "IBM Plex Mono:h14"
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"
opt.hidden = true -- Enable modified buffers in background
opt.ignorecase = true -- Ignore case
opt.inccommand = "split" -- preview incremental substitute
opt.joinspaces = false -- No double spaces with join after a dot
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = indent -- Size of an indent
opt.showmode = false -- dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = indent -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wrap = false -- Disable line wrap
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
-- vim.o.shortmess = "IToOlxfitn"
-- don't load plugins
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
-- Use proper syntax highlighting in code blocks
local fences = {
  "console=sh",
  "zsh=sh",
  "javascript",
  "js=javascript",
  "json",
  "lua",
  "python",
  "sh",
  "shell=sh",
  "ts=typescript",
  "typescript",
}
g.markdown_fenced_languages = fences
-- plasticboy/vim-markdown
g.vim_markdown_folding_level = 10
g.vim_markdown_fenced_languages = fences
g.vim_markdown_folding_style_pythonic = 1
g.vim_markdown_conceal_code_blocks = 0
g.vim_markdown_frontmatter = 1
g.vim_markdown_strikethrough = 1
-- markdown file settings
cmd([[autocmd FileType markdown nnoremap gO <cmd>Toc<cr>]])
cmd([[autocmd FileType markdown setlocal spell]])
-- Check if we need to reload the file when it changed
cmd("au FocusGained * :checktime")
-- show cursor line only in active window
cmd([[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]])
-- go to last loc when opening a buffer
cmd([[
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
]])
-- Highlight on yank
cmd("au TextYankPost * lua vim.highlight.on_yank {}")
-- windows to close with "q"
cmd([[autocmd FileType help,startuptime,qf,lspinfo nnoremap <buffer><silent> q :close<CR>]])
cmd([[autocmd FileType man nnoremap <buffer><silent> q :quit<CR>]])
