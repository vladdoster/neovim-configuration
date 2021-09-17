local lspinstall = require"lspinstall"

local languages = {
    'java',
    'bash',
    'dockerfile',
    'lua',
    'python',
    'rust',
    'json',
    'typescript',
    'css',
    'html',
}

local install_servers = function()
    for _, lang in ipairs(languages) do lspinstall.install_server(lang) end
end

return {install_servers = install_servers}
