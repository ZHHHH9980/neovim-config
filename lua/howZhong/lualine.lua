local function unstaged_files()
  local cmd = "git ls-files -m"
  local unstaged_output = vim.fn.system(cmd)
  local unstaged_files = vim.split(unstaged_output, "\n")
  local count = #unstaged_files
  if count > 0 then
    return "📁 " .. count
  else
    return ""
  end
end

require('lualine').setup {
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(mode_name)
          local mode_map = {
            ['NORMAL'] = 'N',
            ['INSERT'] = 'I',
            ['VISUAL'] = 'V',
            ['COMMAND'] = 'C',
            ['SELECT'] = 'S',
            ['REPLACE'] = 'R',
            ['TERMINAL'] = 'T',
          }
          return mode_map[mode_name] or mode_name
        end
      }
    },
    lualine_c = {
      {
        'filename',
        path = 1,
      },
      {
        unstaged_files,
        color = { fg = "#ff9900" },
      },
    },
    lualine_x = {}, -- 将 lualine_x 设置为空表,隐藏其中的组件
    lualine_y = {}, -- 将 lualine_y 设置为空表,隐藏其中的组件
    lualine_z = {}  -- 将 lualine_z 设置为空表,隐藏其中的组件
  },
}
