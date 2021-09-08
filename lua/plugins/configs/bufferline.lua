local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

-- function executed for top right close button in bufferline
vim.cmd "function! NvChad_bufferline_quitvim(a,b,c,d) \n qa \n endfunction"

bufferline.setup {
    options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        always_show_bufferline = true,
        buffer_close_icon = "",
        close_icon = "",
        diagnostics = false,
        enforce_regular_tabs = false,
        left_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        modified_icon = "",
        right_trunc_marker = "",
        separator_style = "thin",
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        tab_size = 20,
        view = "multiwindow",
        custom_filter = function(buf_number) -- filter out our managed/persistent split terms
            local present_type, type = pcall(function()
                return vim.api.nvim_buf_get_var(buf_number, "term_type")
            end)

            if present_type then
                if type == "vert" then
                    return false
                elseif type == "hori" then
                    return false
                else
                    return true
                end
            else
                return true
            end
        end,
    },
}
