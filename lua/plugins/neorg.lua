return {
  {
    "nvim-neorg/neorg",
    dependencies = {"nvim-lua/plenary.nvim"},
    build = ":Neorg sync-parsers",
    --tag = "*",
    event = "VeryLazy",
    ft = "norg",
    cmd = "Neorg",
    config = function ()
      require("configs.neorg")
    end
  },
}
