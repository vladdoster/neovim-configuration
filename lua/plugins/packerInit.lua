vim.cmd 'packadd packer.nvim'
local present, packer = pcall(require, 'packer')
if not present then
    local packer_path = vim.fn.stdpath 'data' ..
                            '/site/pack/packer/opt/packer.nvim'
    print 'Cloning packer..'
    vim.fn.delete(packer_path, 'rf')
    vim.fn.system {
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        '--depth',
        '20',
        packer_path
    }
    vim.cmd 'packadd packer.nvim'
    present, packer = pcall(require, 'packer')
    if not present then
        error('Couldn\'t clone packer !\nPacker path: ' .. packer_path)
    end
end
return require('packer').init({
    display={
        open_fn=function()
            return require('packer.util').float {border='rounded'}
        end,
        prompt_border='rounded'
    },
    git={clone_timeout=600}
})
