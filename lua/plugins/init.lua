return {
  {
    "epwalsh/obsidian.nvim",
    -- version = "*",
    event = "VeryLazy",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = function ()
      return require "configs.obsidian"
    end
  },
  {
    "preservim/vim-markdown",
    event = "VeryLazy",
    ft = "markdown",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "configs.null-ls"
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "nvchad.configs.lspconfig".defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function ()
      require("catppuccin").setup({
        integrations = {
          treesitter = true,
        }
      })
    end
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  --   config = function ()
  --     require "configs.copilot"
  --   end
  -- },
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "cpp",
        "python",
        "lua",
        "markdown",
        "markdown_inline"
      }
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua
        "lua-language-server",
        -- CPP
        "clangd",
        "clang-format",
        "codelldb",
        -- SQL
        "sqlls",
        -- Python
        "pyright",
        "black",
        -- PHP
        "intelephense",
        "emmet-ls",
      }
    }
  },
}
