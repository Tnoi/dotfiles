-- lua/plugins/snacks.lua

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        explorer = { enabled = true },
        picker = {
            enabled = true,
            hidden = true,
        },
        terminal = { enabled = true },
    },
}
