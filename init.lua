local modules = {
	"options",
    "plugins",
	"mappings",
	"utils",
}

for i = 1, #modules, 1 do
	pcall(require, modules[i])
end
