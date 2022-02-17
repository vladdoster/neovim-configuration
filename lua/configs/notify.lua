local ok, notify = pcall(require, "notify")
if not ok then return end
vim.notify = notify
notify.setup {
		stages='slide',
		timeout=2500,
		minimum_width=50,
		icons={
				ERROR='ERROR: ',
				WARN='WARNING: ',
				INFO='INFO: ',
				DEBUG='DEBUG: ',
				TRACE='TRACE: '
		}
}
