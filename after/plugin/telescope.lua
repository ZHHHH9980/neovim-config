local builtin = require('telescope.builtin')

local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

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

vim.keymap.set('n', '<leader>ps', function()
  builtin.live_grep({
    prompt_title = 'Search in Files',
    default_text = vim.fn.expand('<cword>'),
    -- 竖屏用 vertical
    layout_strategy = 'vertical',
    layout_config = {
      horizontal = {
        width = 0.6,
      },
    },
  })
end)


vim.keymap.set('n', '<C-p>', function()
  builtin.git_files({
    -- 竖屏用 vertical
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        width = 0.6,
      },
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
      vertical = {
        width = 0.8,
        preview_width = 0.8,
      },
    },
  })
end, { desc = '[P]review [R]eferences' })
