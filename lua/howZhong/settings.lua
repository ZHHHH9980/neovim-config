-- disable automatic comment wrapping and insertion
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- 设置 Tab 为 2 个空格
vim.opt.tabstop = 2      -- 一个 Tab 显示为两个空格宽度
vim.opt.shiftwidth = 2   -- 缩进级别的宽度
vim.opt.softtabstop = 2  -- 在编辑时，Tab/退格键的宽度
vim.opt.expandtab = true -- 将 Tab 转换为空格

-- 设置命令等待时间为 1000 毫秒（1 秒）
vim.opt.timeoutlen = 500

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true


vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "100"


-- 开启光标所在行的高亮
vim.wo.cursorline = true

-- 设置光标所在行的高亮背景色为更深的颜色
vim.api.nvim_command('hi CursorLine cterm=NONE ctermbg=235 ctermfg=NONE guibg=#121212')

-- 设置 normal 模式下的光标样式为块状
vim.opt.guicursor:append("n-v-c:block")

-- 设置 insert 模式下的光标样式为竖线
vim.opt.guicursor:append("i-ci-ve:ver25")

-- 设置 replace 模式下的光标样式为下划线
vim.opt.guicursor:append("r-cr:hor20")


-- 定义一个函数来设置 Visual 模式的高亮样式
function SetVisualHighlight()
  -- 设置 Visual 模式的高亮组
  vim.cmd([[
                  hi Visual guibg=#FF8C00 guifg=white
                      ]])
end

-- 在 VimEnter 自动命令中调用 SetVisualHighlight 函数
vim.cmd([[
                        augroup CustomVisualHighlight
                                autocmd!
                                        autocmd VimEnter * lua SetVisualHighlight()
                                            augroup END
                                            ]])
