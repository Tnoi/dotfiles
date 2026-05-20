-- lua/config/keymaps.lua

local map = vim.keymap.set

-- Lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Open lazy.nvim" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- save file
map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- movement
map("n", "0", "$", { desc = "Move to end of line" })
map("n", "1", "0", { desc = "Move to start of line" })

-- windows
map("n", "<leader>ww", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>wd", "<cmd>close<cr>", { desc = "Delete window" })

-- windows: move to window using <ctrl> hjkl keys
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })

-- windows: resize using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- tabs
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close tab" })
map("n", "<leader><tab>l", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<leader><tab>h", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
map("n", "<leader><tab>0", "<cmd>tablast<cr>", { desc = "Last tab" })
map("n", "<leader><tab>1", "<cmd>tabfirst<cr>", { desc = "First tab" })
