for _, module in ipairs({'options', 'autocmds', 'mappings'}) do
    local ok, err = pcall(require, "core." .. module)
    if not ok then error("Error loading " .. module .. "\n\n" .. err) end
end

local ok, impatient = pcall(require, "impatient")
if ok then
    require("packer_compiled")
    impatient.enable_profile()
end
