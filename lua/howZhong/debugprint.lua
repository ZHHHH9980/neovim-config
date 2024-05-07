local js_ts_format = {
  left = 'console.log(`',
  right = '`);',
  mid_var = "${",
  right_var = '}`)',
}


local opts = {
  keymaps = {
    normal = {
      variable_below = "<leader>l",
      variable_below_alwaysprompt = nil,
      variable_above_alwaysprompt = nil,
    },
    visual = {
      variable_below = "<leader>l",
    },
  },
  commands = {
    toggle_comment_debug_prints = "ToggleCommentDebugPrints",
    delete_debug_prints = "DeleteDebugPrints",
  },
  filetypes = {
    ["javascript"] = js_ts_format,
    ["typescript"] = js_ts_format,
    ["typescriptreact"] = js_ts_format,
  }
}

return opts
