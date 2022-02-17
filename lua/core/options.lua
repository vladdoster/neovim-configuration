local M = {}
local set = vim.opt
local global_settings = {
    autoread=true,
    background='dark',
    backup=false,
    cmdheight=2,
    colorcolumn='120',
    cursorline=true,
    diffopt='internal,filler,vertical,iwhite',
    hidden=true,
    ignorecase=true,
    inccommand='nosplit',
    incsearch=true,
    laststatus=2,
    listchars=[[eol:$,tab:>-,trail:~,extends:>,precedes:<]],
    modeline=true,
    printoptions='bottom:1in',
    scrolloff=8,
    shada=[[!,'500,<50,s10,h]],
    shiftwidth=2,
    showcmd=true,
    showmode=false,
    sidescrolloff=8,
    smartcase=true,
    splitbelow=true,
    startofline=false,
    swapfile=false,
    tabstop=2,
    termguicolors=true,
    title=true,
    titlestring='%{join(split(getcwd(), \'/\')[-2:], \'/\')}',
    viminfo=[[!,'300,<50,s10,h]],
    wildignorecase=true,
    wildmenu=true,
    wildmode='longest:full,full',
    wrap=false
}
for name, value in pairs(global_settings) do set[name] = value end
-- vim.opt.shadafile = "NONE"
-- vim.schedule(function()
-- vim.opt.shadafile = vim.opt.shadafile
-- vim.cmd [[ silent! rsh ]]
-- end)
return M
