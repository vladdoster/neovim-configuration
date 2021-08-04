-- PACKER BOOTSTRAP
local present, _ = pcall(require, "packer")

if not present then
    local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

    print("--- cloning packer repository")
    -- remove the dir before cloning
    vim.fn.delete(packer_path, "rf")
    vim.fn.system({
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        packer_path,
    })

    vim.cmd("packadd packer.nvim")
    present, _ = pcall(require, "packer")

    if present then
        print("--- Packer cloned successfully.")
    else
        error("--- ERROR: failed to clone packer !\nPacker path: " .. packer_path)
    end
else
    return
end

local packer = require("packer")

return packer.init({
    git = {
        clone_timeout = 600, -- Timeout, in seconds, or git clones
    },
})
