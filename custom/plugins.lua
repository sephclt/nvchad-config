local plugins = {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    event = "VeryLazy",
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = function ()
      return require "custom.configs.obsidian"
    end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-neorg/neorg",
    dependencies = {"nvim-lua/plenary.nvim"},
    build = ":Neorg sync-parsers",
    --tag = "*",
    -- lazy = true,
    event = "VeryLazy",
    ft = "norg",
    cmd = "Neorg",
    config = function ()
      require "custom.configs.neorg"
    end
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function ()
      require "custom.configs.copilot"
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    }
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- CPP
        "clangd",
        "clang-format",
        "codelldb",
        -- SQL
        "sqlls",
        "sql-formatter",
        "sqlfluff",
        -- Python
        "pyright",
        "flake8",
        "autopep8",
        "intelephense",
        "emmet-ls",
        -- Markdown
        "markdownlint",
        "marksman",
      }
    }
  }
}

return plugins
