vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    }
})

require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath('data') .. '/site'
})

require("nvim-treesitter").install {
    "c",
    "cpp",
    "json",
    "lua",
    "markdown",
    "python",
}

-- highlighting, indentation and folds
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreeSitter", { clear = true }),
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if vim.list_contains(require("nvim-treesitter.config").get_installed(), lang) then
            vim.treesitter.start(args.buf)

            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

            vim.wo[0][0].foldmethod = 'expr'
            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        end
    end,
})

