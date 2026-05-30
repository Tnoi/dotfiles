vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim"
})

require("mini.cursorword").setup()
require("mini.indentscope").setup()
require("mini.trailspace").setup()

require("mini.pairs").setup()
require("mini.surround").setup()

require("mini.bufremove").setup()

require("mini.diff").setup({
    view = {
        style = "sign",
        signs = { add = '▒', change = '▒', delete = '▒' },
    },
})
require("mini.git").setup()

require("mini.notify").setup()
