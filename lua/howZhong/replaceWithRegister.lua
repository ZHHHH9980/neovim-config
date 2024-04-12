-- 在普通模式下,将 r 键映射到 <Plug>ReplaceWithRegisterOperator
vim.api.nvim_set_keymap('n', 'r', '<Plug>ReplaceWithRegisterOperator', {})

-- 在普通模式下,将 rr 键映射到 <Plug>ReplaceWithRegisterLine
vim.api.nvim_set_keymap('n', 'rr', '<Plug>ReplaceWithRegisterLine', {})

-- 在可视模式下,将 r 键映射到 <Plug>ReplaceWithRegisterVisual
vim.api.nvim_set_keymap('x', 'r', '<Plug>ReplaceWithRegisterVisual', {})
