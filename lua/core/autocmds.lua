vim.cmd [[ au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif ]]

vim.cmd(
    [[
		augroup dashboard_settings
		autocmd!
		autocmd FileType dashboard set showtabline=0
		autocmd BufWinLeave <buffer> set showtabline=2
		autocmd BufEnter * if &ft is "dashboard" | set laststatus=0 | else | set laststatus=2 | endif
		autocmd BufEnter * if &ft is "dashboard" | set nocursorline | endif
		augroup end
	]]
)

-- vim.cmd([[
-- augroup vimStartup
-- au!
-- " When editing a file, always jump to the last known cursor position.
-- " Don't do it when the position is invalid, when inside an event handler
-- " (happens when dropping a file on gvim) and for a commit message (it's
-- " likely a different one than last time).
-- autocmd BufReadPost *
-- \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
-- \ |   exe "normal! g`\""
-- \ | endif
-- augroup END
-- ]])

function nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        vim.cmd('augroup ' .. group_name)
        vim.cmd('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
            vim.cmd(command)
        end
        vim.cmd('augroup END')
    end
end

-- vim.cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]
local autocmds = {
    relative_num_on = {{'InsertEnter', '*', 'setlocal number'}},
    relative_num_off = {{'InsertLeave', '*', 'setlocal relativenumber'}},
    save_shada = {{'VimLeave', '*', 'wshada!'}},
    resize_windows_proportionally = {{'VimResized', '*', ':wincmd ='}},
    toggle_search_highlighting = {{'InsertEnter', '*', 'setlocal nohlsearch'}},
    lua_highlight = {
        {
            'TextYankPost',
            '*',
            [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]],
        },
    },
    ansi_esc_log = {{'BufEnter', '*.log', ':AnsiEsc'}},
    python_file = {
        {
            'Filetype',
            'python',
            'setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4',
        },
    },
}

nvim_create_augroups(autocmds)

