local sources = { "plugins", "core" }
for _, source in ipairs(sources) do
	local ok, err = pcall(require, source)
	if not ok then
		error("Failed to load " .. source)
	end
end
