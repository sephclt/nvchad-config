---@type ChadrcConfig
local M = {}

M.ui = {
  statusline = {
    theme = "vscode_colored",

    --separator_style = "block"
  },

  theme = "catppuccin",

  nvdash = {
    load_on_startup = true
  }
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
