local null_ls = require('null-ls')


null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.formatting.prettier,
  },
})

-- 自动format
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.css", "*.scss", "*.html", "*.json" },
  command = "lua vim.lsp.buf.format()",
})
