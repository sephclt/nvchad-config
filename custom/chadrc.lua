---@type ChadrcConfig
local M = {}

M.ui = {
  statusline = {
    theme = "default",

    separator_style = "round"
  },

  theme = "catppuccin",

  nvdash = {
    load_on_startup = true
  }
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
