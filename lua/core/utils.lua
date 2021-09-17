local M = {}

M.close_buffer = function(bufexpr, force)
   local opts = {
      next = "cycle", -- how to retrieve the next buffer
      quit = false, -- exit when last buffer is deleted
   }

   local function switch_buffer(windows, buf)
      local cur_win = vim.fn.winnr()
      for _, winid in ipairs(windows) do
         vim.cmd(string.format("%d wincmd w", vim.fn.win_id2win(winid)))
         vim.cmd(string.format("buffer %d", buf))
      end
      vim.cmd(string.format("%d wincmd w", cur_win)) -- return to original window
   end

   local function get_next_buf(buf)
      local next = vim.fn.bufnr "#"
      if opts.next == "alternate" and vim.fn.buflisted(next) == 1 then
         return next
      end
      for i = 0, vim.fn.bufnr "$" - 1 do
         next = (buf + i) % vim.fn.bufnr "$" + 1 -- will loop back to 1
         if vim.fn.buflisted(next) == 1 then
            return next
         end
      end
   end

   local buf = vim.fn.bufnr()
   if vim.fn.buflisted(buf) == 0 then -- exit if buffer number is invalid
      vim.cmd "close"
      return
   end

   if #vim.fn.getbufinfo { buflisted = 1 } < 2 then
      if opts.quit then
         if force then
            vim.cmd "qall!"
         else
            vim.cmd "confirm qall"
         end
         return
      end

      local is_term, type = pcall(function()
         return vim.api.nvim_buf_get_var(buf, "term_type")
      end)

      if is_term then
         vim.cmd(string.format("setlocal nobl", buf))
         vim.cmd "enew"
         return
      end
      vim.cmd "enew"
      vim.cmd "bp"
   end

   local next_buf = get_next_buf(buf)
   local windows = vim.fn.getbufinfo(buf)[1].windows

   if force or vim.fn.getbufvar(buf, "&buftype") == "terminal" then
      local is_term, type = pcall(function()
         return vim.api.nvim_buf_get_var(buf, "term_type")
      end)

      if is_term then
         if type == "wind" then
            vim.cmd(string.format("%d bufdo setlocal nobl", buf))
            vim.cmd "BufferLineCycleNext"
         else
            local cur_win = vim.fn.winnr()
            vim.cmd(string.format("%d wincmd c", cur_win))
            return
         end
      else
         switch_buffer(windows, next_buf)
         vim.cmd(string.format("bd! %d", buf))
      end
   else
      switch_buffer(windows, next_buf)
      vim.cmd(string.format("silent! confirm bd %d", buf))
   end
   if vim.fn.buflisted(buf) == 1 then
      switch_buffer(windows, buf)
   end
end

M.map = function(mode, keys, cmd, opt)
   local options = { noremap = true, silent = true }
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

   local valid_modes = {
      [""] = true,
      ["n"] = true,
      ["v"] = true,
      ["s"] = true,
      ["x"] = true,
      ["o"] = true,
      ["!"] = true,
      ["i"] = true,
      ["l"] = true,
      ["c"] = true,
      ["t"] = true,
   }

   local function map_wrapper(mode, lhs, rhs, options)
      if type(lhs) == "table" then
         for _, key in ipairs(lhs) do
            map_wrapper(mode, key, rhs, options)
         end
      else
         if type(mode) == "table" then
            for _, m in ipairs(mode) do
               map_wrapper(m, lhs, rhs, options)
            end
         else
            if valid_modes[mode] and lhs and rhs then
               vim.api.nvim_set_keymap(mode, lhs, rhs, options)
            else
               mode, lhs, rhs = mode or "", lhs or "", rhs or ""
               print("Cannot set mapping [ mode = '" .. mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]")
            end
         end
      end
   end

   map_wrapper(mode, keys, cmd, options)
end

return M
