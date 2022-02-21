local function clock() return os.date('%H:%M') end
local function lsp_progress(_, is_active)
  if not is_active then return end
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then return '' end
  local status = {} -- dump(messages)
  for _, msg in pairs(messages) do
    local title = ''
    if msg.title then title = msg.title end
    table.insert(status, (msg.percentage or 0) .. '%% ' .. title)
  end
  local spinners = {
    '⠋',
    '⠙',
    '⠹',
    '⠸',
    '⠼',
    '⠴',
    '⠦',
    '⠧',
    '⠇',
    '⠏',
  }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, ' | ') .. ' ' .. spinners[frame + 1]
end
vim.cmd('au User LspProgressUpdate let &ro = &ro')
local config = {
  options = {
    theme = 'tokyonight',
    section_separators = {left = '|', right = '|'},
    component_separators = {left = '|', right = '|'},
    icons_enabled = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {'diagnostics', sources = {'nvim_diagnostic'}},
      {
        'filetype',
        icon_only = true,
        separator = '',
        padding = {left = 1, right = 0},
      },
      {'filename', path = 1, symbols = {modified = 'M', readonly = ''}},
      {
        function()
          local gps = require('nvim-gps')
          return gps.get_location()
        end,
        cond = function()
          local gps = require('nvim-gps')
          return pcall(require, 'nvim-treesitter.parsers') and gps.is_available()
        end,
        color = {fg = '#ff9e64'},
      },
    },
    lualine_x = {
      lsp_progress,
      require('github-notifications').statusline_notification_count,
    },
    lualine_y = {'location'},
    lualine_z = {clock},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {'nvim-tree'},
}
local M = {}
function M.load()
  local name = vim.g.colors_name or ''
  local ok, _ = pcall(require, 'lualine.themes.' .. name)
  if ok then config.options.theme = name end
  require('lualine').setup(config)
end
M.load()
return M
