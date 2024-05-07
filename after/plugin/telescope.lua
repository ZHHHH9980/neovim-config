local builtin = require('telescope.builtin')
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- Add custom arguments
table.insert(vimgrep_arguments, "--hidden")   -- Search in hidden/dot files
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*") -- Exclude `.git` directory

telescope.setup({
  defaults = {
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
})

-- Logging functions
local function get_log_file_path()
  return vim.fn.getcwd() .. "/telescope_log.txt"
end


local function write_log(message)
  local log_file_path = get_log_file_path()
  local log_file = io.open(log_file_path, "a")
  if log_file then
    log_file:write(message .. "\n")
    log_file:close()
  else
    vim.notify("Failed to write to log file at " .. log_file_path, vim.log.levels.ERROR)
  end
end



-- Key mappings
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.live_grep({
    prompt_title = 'Search in Files',
    default_text = vim.fn.expand('<cword>'),
    layout_strategy = 'vertical',
    layout_config = {
      horizontal = { width = 0.6 },
    },
  })
end)

vim.keymap.set('n', '<C-p>', function()
  builtin.git_files({
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.6 },
    },
    prompt_title = 'Search Files in Git Repository',
    show_untracked = true,
  })
end)

vim.keymap.set('n', 'gr', function()
  builtin.lsp_references({
    prompt_title = 'LSP References',
    layout_strategy = 'vertical',
    layout_config = {
      vertical = { width = 0.8, preview_width = 0.8 },
    },
  })
end, { desc = '[P]review [R]eferences' })



-- see https://github.com/nvim-telescope/telescope.nvim/issues/1923
function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

vim.keymap.set('v', '<leader>ps', function()
  write_log("Executing '<leader>ps' mapping")
  local selected_text = vim.getVisualSelection()
  write_log("Selected text: " .. selected_text)
  builtin.live_grep({
    prompt_title = 'Search in Files',
    default_text = selected_text,
    layout_strategy = 'vertical',
    layout_config = {
      horizontal = { width = 0.6 },
    },
  })
end)

vim.api.nvim_set_keymap(
  'n',
  '<leader>r',
  "<cmd>Telescope registers<cr>",
  { noremap = true, silent = true }
)
