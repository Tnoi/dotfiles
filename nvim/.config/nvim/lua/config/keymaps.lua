local map = vim.keymap.set
map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to Definition" })

-- FzfLua
map("n", "<leader><leader>", "<cmd>FzfLua files<cr>", { desc = "Files" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Files" })
map("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Grep" })
map("n", "<leader>fr", "<cmd>FzfLua history<cr>", { desc = "History" })
map("n", "<leader>fz", "<cmd>FzfLua zoxide<cr>", { desc = "Zoxide" })
map("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "Neovim Help" })

-- NvimTree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Explorer" })

-- Yazy
map("n", "<leader>y", "<cmd>Yazi<cr>", { desc = "Yazi" })

-- LazyGit
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazygit" })

-- Git
map("n", "<leader>gi", "<cmd>Git initcr>", { desc = "Git init" })
map("n", "<leader>ga", "<cmd>Git add %<cr>", { desc = "Git add" })
map("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
map("n", "<leader>gd", "<cmd>Git diff<cr>", { desc = "Git diff" })
map("n", "<leader>gs", "<cmd>Git show<cr>", { desc = "Git show" })
map("n", "<leader>gp", "<cmd>Git pull<cr>", { desc = "Git push" })
map("n", "<leader>gP", "<cmd>Git push<cr>", { desc = "Git pull" })

map("n", "<leader>gh", "gh", { desc = "Apply hunk" })
map("n", "<leader>gH", "gH", { desc = "Reset hunk" })
map("n", "<leader>go", function()
    require("mini.diff").toggle_overlay()
end, { desc = "Toggle hunk overlay" })

-- Mason
map("n", "<leader>m", "<cmd>Mason<cr>")

-- buffers
map("n", "<leader>bb", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })
map("n", "<leader>bd", function()
    require("mini.bufremove").delete()
end, { desc = "Delete buffer" })

-- windows
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>ws", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>wd", "<cmd>close<cr>", { desc = "Delete window" })

map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })

-- movement
map("n", "j", function()
    return vim.v.count == 0 and "gj" or "j"
end, { expr = true, silent = true, desc = "Down (wrap-aware)" })
map("n", "k", function()
    return vim.v.count == 0 and "gk" or "k"
end, { expr = true, silent = true, desc = "Up (wrap-aware)" })

map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })

map("n", "<D-k>", ":m .-2<cr>==", { desc = "Move line up" })
map("n", "<D-j>", ":m .+1<cr>==", { desc = "Move line down" })
map("i", "<D-k>", "<esc>:m .-2<cr>==", { desc = "Move line up" })
map("i", "<D-j>", "<esc>:m .+1<cr>==", { desc = "Move line down" })
map("v", "<D-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })
map("v", "<D-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })

map("v", ">", ">gv", { desc = "Indent right and reselect" })
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", "<Tab>", ">gv", { desc = "Indent right and reselect" })
map("v", "<S-Tab>", "<gv", { desc = "Indent left and reselect" })

-- save
map({ "n", "i", "x", "s" }, "<D-s>", function()
    local save_file = function(path)
        local ok, err = pcall(vim.cmd.w, path)
        if not ok then
            vim.cmd.redraw()
            vim.notify(err, vim.log.levels.ERROR, { title = "error while saving file" })
        end
    end
    if vim.api.nvim_buf_get_name(0) ~= "" then
        save_file()
    else
        vim.ui.input({ prompt = "Filename: " }, save_file)
    end
end, { desc = "Save file" })

-- reload
map("n", "<leader>r", "<cmd>source %<cr>", { desc = "Reload" })

-- quit
map("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>q!", "<cmd>q!<cr>", { desc = "Force quit" })

