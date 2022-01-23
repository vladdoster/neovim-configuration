local present, terminal = pcall(require, 'toggleterm')
if present then
    terminal.setup {
        size=function(term)
            if term.direction == 'horizontal' then
                return 15
            elseif term.direction == 'vertical' then
                return vim.o.columns * 0.4
            end
        end,
        open_mapping=[[<C-t>]],
        hide_numbers=true, -- hide    the number   column in   toggleterm buffers
        shade_filetypes={},
        shade_terminals=true,
        start_in_insert=true,
        insert_mappings=true, -- whether or  not      the    open mapping    applies in insert mode
        persist_size=true,
        direction='vertical',
        close_on_exit=true, -- close   the terminal window when the        process exits
        shell=vim.o.shell -- change  the default  shell
    }
    function _G.set_terminal_keymaps()
        local opts = {noremap=true}
        vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
    end
    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end
