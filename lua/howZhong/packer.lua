-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use(
    'nvim-treesitter/nvim-treesitter',
    {
      commit = 'f197a15',
      run = ':TSUpdate'
    }
  )

  -- color theme
  use 'sainnhe/everforest'


  -- bottom tools
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- replace
  use 'vim-scripts/ReplaceWithRegister'

  -- 左侧文件树 & 图标
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-tree/nvim-tree.lua'

  -- 顶部 tab
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  -- 自动匹配括号
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- 注释
  use {
    'numToStr/Comment.nvim',
  }

  -- copilot
  use 'github/copilot.vim'

  use 'easymotion/vim-easymotion'


  -- replace '' to ""
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- git tools
  use('tpope/vim-fugitive')

  use {
    'goolord/alpha-nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  -- 糅合 ts server prettier
  use 'jose-elias-alvarez/null-ls.nvim'
  use {
    'jayp0521/mason-null-ls.nvim',
    config = function()
      require("mason-null-ls").setup()
    end,
    requires = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" }
  }

  -- jsx 自动闭合标签
  use 'windwp/nvim-ts-autotag'

  -- 编辑历史 & 回退
  use 'mbbill/undotree'

  -- 选中多个
  use 'mg979/vim-visual-multi'

  -- search and replace
  use 'dyng/ctrlsf.vim'

  use({
    "andrewferrier/debugprint.nvim",
    config = function()
      local opts = require('howZhong.debugprint')   -- 引入配置
      require("debugprint").setup(opts)
    end,
    requires = {
      "echasnovski/mini.nvim",            -- 为 NeoVim <= 0.9 启用 :ToggleCommentDebugPrints
      "nvim-treesitter/nvim-treesitter"   -- 为 NeoVim 0.8 启用 treesitter
    }
  })
end)
