-- 设置 leader 键为空格
vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- set line number to relative
vim.opt.relativenumber = true

-- 保存和退出映射
-- vim.api.nvim_set_keymap('n', 'Q', ':q<CR>', {noremap = true, silent = true})

-- 设置 Ctrl+s 为保存
vim.api.nvim_set_keymap('n', 'S', ':w<CR>', { noremap = true, silent = true })

-- 重新映射方向键
vim.api.nvim_set_keymap('n', 'i', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'i', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'k', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'j', 'h', { noremap = true, silent = true })

-- go down 10 lines when press K
vim.api.nvim_set_keymap('n', 'K', '10j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'K', '10j', { noremap = true, silent = true })

--go up 10 lines when press K
vim.api.nvim_set_keymap('v', 'I', '10k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'I', '10k', { noremap = true, silent = true })

-- 从普通模式切换到插入模式
vim.api.nvim_set_keymap('n', 'h', 'i', { noremap = true, silent = true })

-- 移动到行尾和行首
vim.api.nvim_set_keymap('n', 'L', 'A', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'J', '^', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'H', 'I', { noremap = true, silent = true })

-- 从插入模式快速返回普通模式
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true, silent = true })

-- 将 Ctrl+c 映射为复制到系统剪贴板
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- 这一步的关键在于，在iterm 2把 left Command remap to Control，否则不会生效
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- 设置 Ctrl+c 为复制到系统剪贴板
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- 设置 Ctrl+v 为从系统剪贴板粘贴
vim.api.nvim_set_keymap('n', '<C-v>', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-v>', '<C-r>+', { noremap = true, silent = true })

-- visual mode , replace selection with default register
-- vim.api.nvim_set_keymap('v', 'r', '"_dP', { noremap = true, silent = true })

-- nd -> delete and copy
-- d -> only delete
vim.api.nvim_set_keymap('n', 'nd', 'd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, silent = true })

-- the same as above
vim.api.nvim_set_keymap('v', 'nd', 'd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, silent = true })

-- nc -> delete and cut
-- c -> only delete
vim.api.nvim_set_keymap('n', 'nc', 'c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'c', '"_c', { noremap = true, silent = true })

-- the same as above
vim.api.nvim_set_keymap('v', 'nc', 'c', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'c', '"_c', { noremap = true, silent = true })

-- Define a function to simplify key mapping
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Insert mode mappings
map('i', 'im', 'import ', {})
map('i', 'ex', 'export ', {})
map('i', 'rn', 'return ', {})
map('i', 'co', 'const ', {})
