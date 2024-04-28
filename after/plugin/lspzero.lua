local cmp = require('cmp')
local lsp = require("lsp-zero")

require('lspconfig').intelephense.setup({})

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'tsserver', 'eslint', 'lua_ls' }
})

require('mason-null-ls').setup({
  ensure_installed = { 'prettier', 'eslint' }
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.format_on_save({
  servers = {
    ['stylua'] = { 'lua' },
    ['lua_ls'] = { 'lua' },
  }
})

-- 过滤 react/index.d.ts 的辅助函数
local function filter(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  return string.match(value.filename, 'react/index.d.ts') == nil
end

local function on_list(options)
  local items = options.items
  if #items > 1 then
    items = filter(items, filterReactDTS)
  end

  vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
  vim.api.nvim_command('cfirst') -- or maybe you want 'copen' instead of 'cfirst'
end

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }


  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition({
      reuse_win = true,
      on_list = function(options)
        on_list({
          items = options.items,
          title = 'LSP Definitions',
          context = options.context,
        })
      end
    })
  end, opts)

  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "g]", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "g[", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

cmp.setup({
  mapping = {
    ['<C-i>'] = cmp.mapping.select_prev_item(),
    ['<C-k>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  preselect = cmp.PreselectMode.Item,
})

lsp.configure('tsserver', {
  settings = {
    completions = {
      completeFunctionCalls = true
    }
  },
  on_attach = function(client, bufnr)
    lsp.on_attach(client, bufnr)
  end,
})

lsp.configure('eslint', {
  on_attach = function(client, bufnr)
    lsp.on_attach(client, bufnr)
  end,
})

lsp.setup()
