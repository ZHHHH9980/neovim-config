
-- 启用终端支持
vim.o.termguicolors = true

-- 配置Everforest主题
vim.cmd([[
  set background=light
  let g:everforest_background = 'soft'
  let g:everforest_enable_italic = 1
  let g:everforest_disable_italic_comment = 1
  colorscheme everforest
]])
