local modules = {
	"options",
    "plugins",
	"mappings",
	"utils",
	"auto_commands",
}

for i = 1, #modules, 1 do
	pcall(require, modules[i])
end
