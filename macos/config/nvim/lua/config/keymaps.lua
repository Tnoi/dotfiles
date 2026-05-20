-- lua/config/keymaps.lua

local map = vim.keymap.set

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- save file
map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open lazy.nvim" })
