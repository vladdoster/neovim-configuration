local modules = {
    "startup",
    "bootstrap_plugins",
    "options",
    "mappings",
    "utils",
    "auto_commands"
}

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end
