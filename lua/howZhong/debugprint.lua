vim.keymap.set('n', '<Leader>l', function()
  local word = vim.fn.expand('<cword>')
  vim.cmd('put =' .. string.format("printf('console.log(''%%s:-------->'', %%s);', '%s', '%s')", word, word))
end, { silent = true })
