local M = {}

M.ui = {
  theme = "gruvchad",
  hl_override = {
    AlphaHeader = {
      fg = "red",
    },
    AlphaButtons = {
      fg = "red",
    },
  },
}
M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
