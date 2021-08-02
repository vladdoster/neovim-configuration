local function load_options()
    local global_local = {
        background = "dark",
        backup = false, -- creates a backup file
        clipboard = "unnamedplus", -- allows neovim to access the system clipboard
        cmdheight = 2, -- more space in the neovim command line for displaying messages
        cmdwinheight = 5,
        colorcolumn = "99999", -- fixes indentline for now
        completeopt = {"menuone", "noselect"},
        shortmess = {"s", "I"},
        conceallevel = 0, -- so that `` is visible in markdown files
        cursorline = true, -- highlight the current line
        display = "lastline",
        encoding = "utf-8",
        expandtab = true, -- convert tabs to spaces
        fileencoding = "utf-8", -- the encoding written to a file
        foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
        foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
        guifont = "JetBrains Mono Font:h15", -- the font used in graphical neovim applications
        hidden = true, -- required to keep multiple buffers and open multiple buffers
        hlsearch = true, -- highlight all matches on previous search pattern
        ignorecase = true, -- ignore case in search patterns
        mouse = "a", -- allow the mouse to be used in neovim
        number = true, -- set numbered lines
        numberwidth = 2, -- set number column width to 2 {default 4}
        pumheight = 10, -- pop up menu height
        relativenumber = true, -- set relative numbered lines
        scrolloff = 8, -- is one of my fav
        shiftwidth = 2, -- the number of spaces inserted for each indentation
        showmode = false, -- we don't need to see things like -- INSERT -- anymore
        showtabline = 2, -- always show tabs
        sidescrolloff = 8,
        signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
        smartcase = true, -- smart case
        smartindent = true, -- make indenting smarter again
        spell = false,
        splitbelow = true, -- force all horizontal splits to go below current window
        splitright = true, -- force all vertical splits to go to the right of current window
        swapfile = false, -- creates a swapfile
        tabstop = 4, -- insert 2 spaces for a tab
        termguicolors = true, -- set term gui colors (most terminals support this)
        timeoutlen = 100, -- time to wait for a mapped sequence to complete (in milliseconds)
        title = true, -- set the title of window to the value of the titlestring
        updatetime = 300, -- faster completion
        wrap = false -- display lines as one long line
    }
    vim.g.python3_host_prog = '/usr/local/bin/python3'
    for name, value in pairs(global_local) do vim.o[name] = value end
end

load_options()

local disabled_built_ins = {
    "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "gzip", "zip",
    "zipPlugin", "tar", "tarPlugin", "getscript", "getscriptPlugin", "vimball",
    "vimballPlugin", "2html_plugin", "logipat", "rrhelper", "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do vim.g["loaded_" .. plugin] = 1 end
