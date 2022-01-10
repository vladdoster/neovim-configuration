local M = {}

M.luasnip = function()
   local present, luasnip = pcall(require, "luasnip")
   if present then
      luasnip.config.set_config {
         history = true,
         updateevents = "TextChanged,TextChangedI",
      }

      require("luasnip/loaders/from_vscode").load { paths ={}}
      require("luasnip/loaders/from_vscode").load()
   end
end

M.autopairs = function()
   local present1, autopairs = pcall(require, "nvim-autopairs")
   local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
   if present1 and present2 then
      autopairs.setup()
      local cmp = require "cmp"
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
   end
end
return M
