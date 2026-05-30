local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("User", { clear = true })

-- highlight yanked text
autocmd("TextYankPost", {
    group = augroup,
    callback = function()
        vim.hl.on_yank()
    end,
})

-- format on save
autocmd("BufWritePre", {
    group = augroup,
    pattern = "*",
    callback = function()
        if vim.treesitter.get_parser() ~= nil then
            if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
                vim.lsp.buf.format({ async = false })
            else
                local pos = vim.api.nvim_win_get_cursor(0)
                vim.cmd("normal! gg0=G")
                vim.api.nvim_win_set_cursor(0, pos)
            end
        end
    end,
})

-- wrap, linebreak and spellcheck on markdown and text files
autocmd("FileType", {
    group = augroup,
    pattern = { "markdown", "text", "gitcommit" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.spell = true
    end,
})

-- set cmdheight = 1 when recording macro
autocmd("RecordingEnter", {
    group = augroup,
    callback = function()
        vim.opt.cmdheight = 1
    end,
})

-- set cmdheight = 0 when stop recording macro
autocmd("RecordingLeave", {
    group = augroup,
    callback = function()
        vim.opt.cmdheight = 0
    end,
})

