local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  },
  v = {
    ["<leader>p"] = { "\"_dP:", "Paste without yanking" },
  }
}

M.obsidian = {
  -- plugin = true,
  n = {
    ["<leader>gl"] = {"<cmd> ObsidianFollowLink <CR>", "Follow the link under the cursor"},
  }
}

M.copilot = {
  i = {
    ["<C-a>"] = {'copilot#Accept("\\<CR>")', "Accept copilot suggestion", opts = { expr = true, replace_keycodes = false } },
    ["<C-f>"] = {'<Plug>(copilot-accept-line)', "Accept the next line"}
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

return M
