local cmd = vim.cmd
local function autocmd(group, cmds, clear)
    clear = clear == nil and false or clear
    if type(cmds) == "string" then
        cmds = { cmds }
    end
    cmd("augroup " .. group)
    if clear then
        cmd [[au!]]
    end
    for _, c in ipairs(cmds) do
        cmd("autocmd " .. c)
    end
    cmd [[augroup END]]
end

-- Open a file from its last left off position
cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

autocmd("misc_aucmds", {
    [[BufWinEnter * checktime]],
    [[TextYankPost * silent! lua vim.highlight.on_yank()]],
    [[FileType qf set nobuflisted ]],
    [[BufWritePre * :%s/\s\+$//e]],
    [[FileType * set formatoptions-=cro]],
    [[InsertEnter * set norelativenumber ]],
    [[InsertLeave * set relativenumber ]],
}, true)
