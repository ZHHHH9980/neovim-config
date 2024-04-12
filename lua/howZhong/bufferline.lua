vim.opt.termguicolors = true

vim.keymap.set('n', '<C-x>', ':bprevious<bar>BufferLineCloseRight<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-X>', ':bprevious<bar>BufferLineCloseRight<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>>', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'E', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'R', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

require("bufferline").setup {
  options = {
    path = 'relative', -- 显示相对路径
  }
}
