local ok, dressing = pcall(require, 'dressing')
if not ok then return end
dressing.setup {
  input = {
    anchor = 'SW',
    border = 'single',
    buf_options = {},
    default_prompt = 'Input:',
    enabled = true,
    get_config = nil,
    insert_only = true,
    mappings = {
      n = { ['<Esc>'] = 'Close', ['<CR>'] = 'Confirm' },
      i = { ['<C-c>'] = 'Close', ['<CR>'] = 'Confirm', ['<Up>'] = 'HistoryPrev', ['<Down>'] = 'HistoryNext' }
    },
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },
    override = function(conf) return conf end,
    prefer_width = 40,
    prompt_align = 'left',
    relative = 'cursor',
    start_in_insert = true,
    width = nil,
    win_options = { winblend = 10, wrap = false }
  },
  select = {
    enabled = true,
    backend = { 'telescope', 'fzf_lua', 'fzf', 'builtin', 'nui' },
    trim_prompt = true,
    telescope = nil,
    fzf = { window = { width = 0.5, height = 0.4 } },
    fzf_lua = { winopts = { width = 0.5, height = 0.4 } },
    nui = {
      border = { style = 'rounded' },
      buf_options = { swapfile = false, filetype = 'DressingSelect' },
      max_height = 40,
      max_width = 80,
      min_height = 10,
      min_width = 40,
      position = '50%',
      relative = 'editor',
      size = nil,
      win_options = { winblend = 10 }
    },
    builtin = {
      anchor = 'NW',
      border = 'rounded',
      buf_options = {},
      height = nil,
      mappings = { ['<Esc>'] = 'Close', ['<C-c>'] = 'Close', ['<CR>'] = 'Confirm' },
      max_height = 0.9,
      max_width = { 140, 0.8 },
      min_height = { 10, 0.2 },
      min_width = { 40, 0.2 },
      override = function(conf) return conf end,
      relative = 'editor',
      width = nil,
      win_options = { winblend = 10 }
    },
    format_item_override = {},
    get_config = nil
  }
}
