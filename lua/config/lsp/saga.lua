require("lspsaga").init_lsp_saga({
  -- use_saga_diagnostic_sign = true
  error_sign = "E",
  warn_sign = "W",
  hint_sign = "H",
  infor_sign = "I",
  -- dianostic_header_icon = '   ',
  code_action_icon = "💡",
  code_action_prompt = { enable = true, sign = true, sign_priority = 20, virtual_text = false },
  -- finder_definition_icon = '  ',
  -- finder_reference_icon = '  ',
  -- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = "e",
    vsplit = "v",
    split = "s",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = { quit = "<ESC>", exec = "<CR>" },
  -- rename_action_keys = {
  --   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
  -- },
  -- definition_preview_icon = '  '
  -- border_style = "single" -- "single" "double" "round" "plus"
  -- rename_prompt_prefix = '➤',
  -- if you don't use nvim-lspconfig you must pass your server name and
  -- the related filetypes into this table
  -- like server_filetype_map = {metals = {'sbt', 'scala'}}
  -- server_filetype_map = {}
})
