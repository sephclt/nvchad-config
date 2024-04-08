require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- General
map("v", "<leader>p", "\'_dP", { desc = "Paste without yanking" })

-- Tmux Navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })

-- Copilot
map("i", "<C-a>", "copilot#Accept('\\<CR>')", { expr = true, replace_keycodes = false, desc = "Accept copilot suggestion" })
map("i", "<C-f>", "<Plug>(copilot-accept-line)", { desc = "Accept the next line" })

-- LazyGit
map("n", "<leader>tl", "<cmd> LazyGit<CR>", { desc = "Toggle lazygit" })

-- Obsidian
map("n", "<leader>on", "<cmd> ObsidianNew<CR>", { desc = "New obsidian note"})
map("n", "<leader>os", "<cmd> ObsidianSearch<CR>", { desc = "Search obsidian notes"})
map("n", "<leader>oe", "<cmd> ObsidianExtract<CR>", { desc = "Extract to new note"})

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
