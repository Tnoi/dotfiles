vim.pack.add({
    "https://github.com/nvim-tree/nvim-tree.lua"
})

require('nvim-tree').setup {
    view = { width = 35 },
    renderer = {
        icons = {
            show = { git = true },
            glyphs = {
                git = {
                    -- unstaged = "U",
                    -- staged   = "S",
                    -- unmerged = "UM",
                    -- renamed  = "R",
                    -- deleted  = "D",
                    untracked = "?",
                    ignored   = "◌",
                },
            },
        },
    },
}

