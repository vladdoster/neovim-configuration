local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
   return
end

ts_config.setup {
   ensure_installed = {
      "go",
      "lua",
      "python",
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
   matchup = {
      enable = true, -- mandatory, false will disable the whole extension
      disable = { "c", "ruby" }, -- optional, list of language that will be disabled
   },
}
