vim.pack.add({
    "https://github.com/folke/which-key.nvim"
})

require("which-key").setup({
    preset = "helix",
})

require("which-key").add({
    { "<leader>",  group = "leader" },

    { "<leader>f", group = "find" },
    { "<leader>b", group = "buffer" },
    { "<leader>w", group = "window" },
    { "<leader>g", group = "git" },
    { "<leader>q", group = "quit" },

    { "[",         group = "prev" },
    { "]",         group = "next" },
    { "g",         group = "goto" },
    { "s",         group = "surrounding" },
    { "z",         group = "fold" },
})

