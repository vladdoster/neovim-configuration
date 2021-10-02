local found, _ = pcall(require, "coq")
if not found then
    return
end

vim.o.completeopt = "menuone,noselect,noinsert"
vim.o.showmode = false

require "coq_3p" {
    { src = "nvimlua", short_name = "nLUA" },
    { src = "figlet", short_name = "BIG" },
}

vim.g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
        recommended = true,
    },
    clients = {
        paths = {
            path_seps = {
                "/",
            },
        },
        buffers = {
            match_syms = true,
        },
    },
    display = {
        ghost_text = {
            enabled = true,
        },
    },
}

vim.cmd "COQnow -s"
