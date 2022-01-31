local cmd = vim.cmd
local M = {}
-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', {noremap=true, silent=true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
cmd 'silent! command PackerClean lua require "plugins" require("packer").clean()'
cmd 'silent! command PackerCompile lua require"plugins" require("packer").compile()'
cmd 'silent! command PackerInstall lua require"plugins" require("packer").install()'
cmd 'silent! command PackerStatus lua require "plugins" require("packer").status()'
cmd 'silent! command PackerSync lua require "plugins" require("packer").sync()'
cmd 'silent! command PackerUpdate lua require "plugins" require("packer").update()'
M.telescope = function()
    local keymaps = {
        ['<leader>cm']=':Telescope git_commits <CR>',
        ['<leader>fa']=':Telescope find_files hidden=true <CR>',
        ['<leader>fb']=':Telescope buffers <CR>',
        ['<leader>ff']=':Telescope find_files <CR>',
        ['<leader>fh']=':Telescope help_tags <CR>',
        ['<leader>fo']=':Telescope oldfiles <CR>',
        ['<leader>fw']=':Telescope live_grep <CR>',
        ['<leader>gt']=':Telescope git_status <CR>'
    }
    M.load_mode('normal_mode', keymaps)
end
local generic_opts_any = {noremap=true, silent=true}
local generic_opts = {
    insert_mode=generic_opts_any,
    normal_mode=generic_opts_any,
    visual_mode=generic_opts_any,
    visual_block_mode=generic_opts_any,
    command_mode=generic_opts_any,
    term_mode={silent=true}
}
local mode_adapters = {
    insert_mode='i',
    normal_mode='n',
    term_mode='t',
    visual_mode='v',
    visual_block_mode='x',
    command_mode='c'
}
local defaults = {
    insert_mode={['jj']='<ESC>', ['jk']='<ESC>', ['kj']='<ESC>'},
    ---@usage change or add keymappings for normal mode
    normal_mode={
        ['<A-Down>']=':resize +2<CR>',
        ['<A-Left>']=':vertical resize +2<CR>',
        ['<A-Right>']=':vertical resize -2<CR>',
        ['<A-Up>']=':resize -2<CR>',
        ['<A-j>']=':m .+1<CR>==',
        ['<A-k>']=':m .-2<CR>==',
        ['<C-Down>']=':resize +2<CR>',
        ['<C-Left>']=':vertical resize -2<CR>',
        ['<C-Right>']=':vertical resize +2<CR>',
        ['<C-Up>']=':resize -2<CR>',
        ['<C-h>']='<C-w>h',
        ['<C-j>']='<C-w>j',
        ['<C-k>']='<C-w>k',
        ['<C-l>']='<C-w>l',
        ['<C-n>']=':NvimTreeToggle<CR>',
        ['<C-s>']='<C-x> s <CR>',
        ['<Esc>']=':noh <CR>',
        ['<Leader>bn']=':bufdo bnext<CR>',
        ['<Leader>bp']=':bufdo bprevious<CR>',
        ['<Leader>ps']=':PackerSync<CR>',
        ['<Leader>st']=':StartupTime<CR>',
        ['<S-TAB>']=':BufferLineCyclePrev <CR>',
        ['<S-h>']=':BufferPrevious<CR>',
        ['<S-l>']=':BufferNext<CR>',
        ['<S-t>']=':enew <CR>',
        ['<S-w>']=':w <CR>',
        ['<TAB>']=':BufferLineCycleNext <CR>',
        ['<leader>d']='<cmd>bdelete!<cr>',
        ['<leader>fm']=':FormatWrite<CR>',
        ['<leader>gb']=':BufferLinePick<cr>',
        ['<leader>mw']=':!mdformat --wrap 80 %<CR>',
        ['<leader>tw']=':%s/\\s\\+$//e<CR>'
    },
    ---@usage change or add keymappings for terminal mode
    term_mode={ -- Terminal window navigation
        ['<C-h>']='<C-\\><C-N><C-w>h',
        ['<C-j>']='<C-\\><C-N><C-w>j',
        ['<C-k>']='<C-\\><C-N><C-w>k',
        ['<C-l>']='<C-\\><C-N><C-w>l'
    },
    ---@usage change or add keymappings for visual mode
    visual_mode={
        ['P']='"0P',
        ['p']='"0p',
        ['<']='<gv',
        ['<C-s>']=':sort<CR>',
        ['>']='>gv'
    },
    ---@usage change or add keymappings for visual block mode
    visual_block_mode={
        ['<A-j>']=':m \'>+1<CR>gv-gv',
        ['<A-k>']=':m \'<-2<CR>gv-gv',
        ['J']=':move \'>+1<CR>gv-gv',
        ['K']=':move \'<-2<CR>gv-gv'
    },
    ---@usage change or add keymappings for command mode
    command_mode={
        ['<C-j>']={
            'pumvisible() ? "\\<C-n>" : "\\<C-j>"',
            {expr=true, noremap=true}
        },
        ['<C-k>']={
            'pumvisible() ? "\\<C-p>" : "\\<C-k>"',
            {expr=true, noremap=true}
        }
    }
}
-- Set key mappings individually
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param key The key of keymap
-- @param val Can be form as a mapping or tuple of mapping and user defined opt
function M.set_keymaps(mode, key, val)
    local opt = generic_opts[mode] or generic_opts_any
    if type(val) == 'table' then
        opt = val[2]
        val = val[1]
    end
    if val then
        vim.api.nvim_set_keymap(mode, key, val, opt)
    else
        pcall(vim.api.nvim_del_keymap, mode, key)
    end
end
-- Load key mappings for a given mode
-- @param mode The keymap mode, can be one of the keys of mode_adapters
-- @param keymaps The list of key mappings
function M.load_mode(mode, keymaps)
    mode = mode_adapters[mode] or mode
    for k, v in pairs(keymaps) do M.set_keymaps(mode, k, v) end
end
-- Load key mappings for all provided modes
-- @param keymaps A list of key mappings for each mode
for mode, mapping in pairs(defaults) do M.load_mode(mode, mapping) end
return M
