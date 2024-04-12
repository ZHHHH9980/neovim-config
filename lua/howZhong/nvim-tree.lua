-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-web-devicons")
-- empty setup using defaults
require("nvim-tree").setup({
  view = {
    relativenumber = true,
    -- 其他视图配置...
  },
  update_cwd = true,   -- 更新当前工作目录到nvim-tree的根节点
  update_focused_file = {
    enable = true,     -- 启用定位到当前文件
    update_cwd = true, -- 更新当前工作目录到当前文件的目录
    ignore_list = {}   -- 忽略列表
  },
  -- 其他配置...
})



-- 1. 如果聚焦，关闭 nvim-tree
-- 2. 如果关闭，开启 nvim-tree
-- 3. 如果开启但是没有聚焦，直接聚焦
local function nvim_tree_toggle_focused()
  if vim.fn.exists(":NvimTreeToggle") == 0 then
    return
  end

  local view = require "nvim-tree.view"
  local is_open = view.is_visible()

  if is_open then
    local bufnr = vim.api.nvim_get_current_buf()
    local winnr = vim.api.nvim_get_current_win()

    vim.cmd("NvimTreeFocus")

    local tree_bufnr = vim.api.nvim_get_current_buf()
    local tree_winnr = vim.api.nvim_get_current_win()

    if bufnr == tree_bufnr and winnr == tree_winnr then
      vim.cmd("NvimTreeClose")
    end
  else
    vim.cmd("NvimTreeOpen")
    vim.cmd("NvimTreeFocus")
  end
end

vim.keymap.set("n", "<C-b>", nvim_tree_toggle_focused, { noremap = true, silent = true })

-- ctrl + j 聚焦 nvim-tree
vim.api.nvim_set_keymap('n', '<C-j>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })

-- ctrl + l 聚焦右侧面板
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'Q', ':NvimTreeClose<CR>:q<CR>', { noremap = true, silent = true })
