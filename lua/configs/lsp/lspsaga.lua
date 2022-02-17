local M = {}
function M.config()
    local status_ok, lspsaga = pcall(require, 'lspsaga')
    if not status_ok then return end
    lspsaga.setup {
        debug = false,
        use_saga_diagnostic_sign = false,
        -- diagnostics
        error_sign = 'E',
        warn_sign = 'W',
        hint_sign = 'H',
        infor_sign = 'I',
        diagnostic_header_icon = '   ',
        diagnostic_prefix_format = '%d. ',
        -- code actions
        code_action_icon = 'A',
        code_action_prompt = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
        },
        code_action_keys = {quit = 'q', exec = '<CR>'},
        finder_definition_icon = '  ',
        finder_reference_icon = '  ',
        max_preview_lines = 10,
        finder_action_keys = {
            open = 'o',
            vsplit = 's',
            split = 'i',
            quit = 'q',
            scroll_down = '<C-f>',
            scroll_up = '<C-b>',
        },
        border_style = 'round',
        definition_preview_icon = 'Def',
        rename_action_keys = {quit = '<C-c>', exec = '<CR>'},
        rename_prompt_prefix = '-> ',
        server_filetype_map = {},
    }
end
return M
