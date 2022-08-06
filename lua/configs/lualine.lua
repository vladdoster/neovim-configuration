local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then return end

local navic = require 'nvim-navic'
local colors = {bg='#202328', black='#000000', fg='#bbc2cf', green='#20C20E', red='#FF0000', yellow='#FFFF00'}

local function attached_clients()
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then return '' end
  local client_names = {}
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then client_names[client.name] = true end
  end
  if next(client_names) then
    local names = ''
    for k, _ in pairs(client_names) do
      if names == '' then
        names = k
      else
        names = names .. ', ' .. k
      end
    end
    return 'LSP: ' .. names
  end
end
local function cwd() return vim.fn.fnamemodify(vim.loop.cwd(), ':~') end

lualine.setup {
  options={
    disabled_filetypes={'neo-tree'},
    always_divide_middle=true,
    component_separators='',
    globalstatus=true,
    icons_enabled=false,
    section_separators='',
    theme={normal={c={fg=colors.green, bg=colors.bg}}, inactive={c={fg=colors.fg, bg=colors.bg}}}
  },
  sections={
    lualine_b={'branch', 'diff', cwd},
    lualine_c={navic.get_location},
    lualine_x={
      {'diagnostics', sources={'nvim_diagnostic'}},
      'filesize',
      'encoding',
      {'filetype', separator={right=''}, right_padding=0},
      {attached_clients, separator={left=''}, left_padding=0}
    }
  },
  inactive_sections={},
  extensions={'quickfix', 'toggleterm', 'fugitive'}
}
