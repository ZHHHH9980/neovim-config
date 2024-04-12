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
  },
}
