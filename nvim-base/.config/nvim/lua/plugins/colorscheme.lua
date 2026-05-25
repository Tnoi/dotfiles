-- lua/plugins/colorscheme.lua

return {
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "f-person/auto-dark-mode.nvim",
        lazy = false,
        dependencies = { "ellisonleao/gruvbox.nvim" },
        config = function()
            require("auto-dark-mode").setup({
                update_interval = 1000,
                set_dark_mode = function()
                    vim.o.background = "dark"
                    vim.cmd.colorscheme("gruvbox")
                end,
                set_light_mode = function()
                    vim.o.background = "light"
                    vim.cmd.colorscheme("gruvbox")
                end,
            })
            require("auto-dark-mode").init()
        end,
    },
}
