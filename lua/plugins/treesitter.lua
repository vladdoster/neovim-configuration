local present, ts_configs = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_configs.setup {
    ensure_installed = {
        "go",
        "lua",
        "python",
    },
    highlight = { enable = true, use_languagetree = true },
    indent = { enable = false },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    refactor = {
        smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
        highlight_definitions = { enable = true },
        -- highlight_current_scope = { enable = true }
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["iF"] = {
                    go = "(function_definition) @function",
                    lua = "(function_definition) @function",
                    python = "(function_definition) @function",
                },
                -- or you use the queries from supported languages with textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["aC"] = "@class.outer",
                ["iC"] = "@class.inner",
                ["ac"] = "@conditional.outer",
                ["ic"] = "@conditional.inner",
                ["ae"] = "@block.outer",
                ["ie"] = "@block.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["is"] = "@statement.inner",
                ["as"] = "@statement.outer",
                ["ad"] = "@comment.outer",
                ["am"] = "@call.outer",
                ["im"] = "@call.inner",
            },
        },
    },
}
