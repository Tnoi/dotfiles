-- lua/plugins/snacks.lua

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = { enabled = true },
        explorer = { enabled = true },
        image = { enabled = true },
        indent = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        picker = {
            enabled = true,
            hidden = true,
        },
        terminal = { enabled = true },
    },
}
