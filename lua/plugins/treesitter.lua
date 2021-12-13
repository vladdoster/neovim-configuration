local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if status_ok then
  local opts = {
    on_config_done = nil,
    ensure_installed = {},
    ignore_install = {},
    matchup = { enable = false },
    highlight = { enable = true, additional_vim_regex_highlighting = true, disable = { "latex" } },
    context_commentstring = { enable = true, config = { json = "", },
  },
    indent = {enable = true, disable = {"python", "html", "javascript"} },
    textobjects = { swap = { enable = false }, select = { enable = false } },
    textsubjects = { enable = false, keymaps = { ["."] = "textsubjects-smart", [";"] = "textsubjects-big" } },
    rainbow = { enable = false, extended_mode = true, max_file_lines = 1000 },
  }
  treesitter_configs.setup(opts)
end
