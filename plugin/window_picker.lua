local ok, window_picker = pcall(require, 'window-picker')
if not ok then return end
window_picker.setup {
  filter_rules={bo={filetype={'notify'}, buftype={}}},
  fg_color='#111111',
  current_win_hl_color='#2D4F67',
  other_win_hl_color='#76946A'
}
vim.keymap.set('n', '-', function()
  local window = window_picker.pick_window {autoselect_one=false, include_current_win=true}
  if window then vim.api.nvim_set_current_win(window) end
end)
