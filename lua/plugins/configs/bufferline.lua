local present, bufferline = pcall(require, "bufferline")
if not present then
    return
end

bufferline.setup {
    options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_regular_tabs = true,
        tab_size = 25,
    },
}
