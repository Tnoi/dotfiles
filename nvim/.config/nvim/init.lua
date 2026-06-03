-- Options
vim.g.mapleader = " "

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = ''
vim.opt.showmatch = true
vim.opt.smoothscroll = true
vim.opt.fillchars = { eob = ' ' }

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath('data') .. '/undodir'

vim.opt.selection = 'inclusive'
vim.opt.iskeyword:append('-')
vim.opt.path:append('**')
vim.opt.clipboard:append('unnamedplus')

vim.opt.foldlevel = 999
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50

-- Keymaps
vim.keymap.set('n', '<leader>ff', function() require('fzf-lua').files() end, { desc = "Files" })
vim.keymap.set('n', '<leader>fb', function() require('fzf-lua').buffers() end, { desc = "Buffers" })
vim.keymap.set('n', '<leader>fg', function() require('fzf-lua').live_grep() end, { desc = "Grep" })
vim.keymap.set('n', '<leader>fr', function() require('fzf-lua').history() end, { desc = "History" })

vim.keymap.set('n', '<leader>y', function() require('yazi').yazi() end, { desc = "Yazi" })
vim.keymap.set('n', '<leader>gg', function() require('lazygit').lazygit() end, { desc = "LazyGit" })

vim.keymap.set('n', '<leader>u', '<cmd>Undotree<cr>', { desc = "Undotree" })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result (centered)' })

vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })

vim.keymap.set('n', '<D-k>', ':m .-2<cr>==', { desc = 'Move line up' })
vim.keymap.set('n', '<D-j>', ':m .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set('i', '<D-k>', '<esc>:m .-2<cr>==', { desc = 'Move line up' })
vim.keymap.set('i', '<D-j>', '<esc>:m .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set('v', '<D-k>', ':m \'<-2<cr>gv=gv', { desc = 'Move selection up' })
vim.keymap.set('v', '<D-j>', ':m \'>+1<cr>gv=gv', { desc = 'Move selection down' })

vim.keymap.set('v', ">", ">gv", { desc = 'Indent right and reselect' })
vim.keymap.set('v', "<", "<gv", { desc = 'Indent left and reselect' })
vim.keymap.set('v', "<Tab>", ">gv", { desc = 'Indent right and reselect' })
vim.keymap.set('v', "<S-Tab>", "<gv", { desc = 'Indent left and reselect' })

vim.keymap.set('n', '<leader>n', '<cmd>enew<cr>', { desc = 'New' })
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>qq', '<cmd>q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>q!', '<cmd>q!<cr>', { desc = 'Force quit' })

-- Autocommands
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.highlight.on_yank() end
})

-- Plugins
vim.pack.add({
    'https://github.com/ellisonleao/gruvbox.nvim',

    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/nvim-tree/nvim-web-devicons',

    'https://github.com/ibhagwan/fzf-lua',

    'https://github.com/folke/which-key.nvim',

    'https://github.com/mikavilpas/yazi.nvim',
    'https://github.com/kdheepak/lazygit.nvim',
    'https://github.com/nvim-lua/plenary.nvim'
})

vim.cmd.packadd('nvim.undotree')

require('gruvbox').setup({ contrast = 'hard' })
vim.cmd.colorscheme("gruvbox")

require('lualine').setup({ options = { theme = 'gruvbox' } })

require("fzf-lua").setup()

require('which-key').setup({ preset = "modern" })
require("which-key").add({
    { "<leader>",  group = "leader" },

    { "<leader>f", group = "find" },
    { "<leader>g", group = "git" },
    { "<leader>q", group = "quit" },

    { "[",         group = "prev" },
    { "]",         group = "next" },
    { "g",         group = "goto" },
    { "z",         group = "fold" },
})

