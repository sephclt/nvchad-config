local neorg = require("neorg")

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/Documents/Notes/Neorg/Notes/",
          school = "~/Documents/Notes/Neorg/School/",
        },
        default_workspace = "notes",
      }
    }
  }
}

return neorg
