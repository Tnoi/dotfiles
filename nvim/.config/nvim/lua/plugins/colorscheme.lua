vim.pack.add({
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/f-person/auto-dark-mode.nvim"
})

require("gruvbox").setup({
    contrast = "hard",
})

require("auto-dark-mode").setup({
    update_interval = 1000,
    set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme("gruvbox")
    end,
    set_light_mode = function()
        vim.opt.background = "light"
        vim.cmd.colorscheme("gruvbox")
    end,
})
require("auto-dark-mode").init()
