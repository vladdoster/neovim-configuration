require('filetype').setup({
  overrides={
    extensions={tf='hcl'},
    complex={['.*git/config']='gitconfig'},
    literal={Jenkinsfile='groovy'},
    function_extensions={
      ['pdf']=function()
        vim.bo.filetype = 'pdf'
        vim.fn.jobstart('open -a preview ' .. '"' .. vim.fn.expand('%') .. '"')
      end
    },
    function_literal={Brewfile=function() vim.cmd('syntax off') end},
    shebang={zsh='sh'}
  }
})
