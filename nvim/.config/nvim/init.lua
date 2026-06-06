-- =============================================================================
-- OPTIONS
-- =============================================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 15

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = 'yes'
vim.opt.statuscolumn = '%l %s'
vim.opt.colorcolumn = '120'
vim.opt.showmode = false
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

vim.opt.autochdir = false

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '●',
            [vim.diagnostic.severity.WARN] = '●',
            [vim.diagnostic.severity.INFO] = '●',
            [vim.diagnostic.severity.HINT] = '●',
        },
    },
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    float = {
        border = 'rounded',
        source = true,
    },
})

-- =============================================================================
-- KEYMAPS
-- =============================================================================
-- Search
vim.keymap.set('n', '<leader><leader>', function()
    require('fzf-lua').buffers()
end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>sf', function()
    require('fzf-lua').files()
end, { desc = 'Files' })
vim.keymap.set('n', '<leader>sg', function()
    require('fzf-lua').live_grep()
end, { desc = 'Grep' })
vim.keymap.set('n', '<leader>s.', function()
    require('fzf-lua').oldfiles()
end, { desc = 'Oldfiles' })
vim.keymap.set('n', '<leader>/', function()
    require('fzf-lua').lgrep_curbuf()
end, { desc = 'Buffer Grep' })
vim.keymap.set('n', '<leader>?', function()
    require('fzf-lua').keymaps()
end, { desc = 'Keymaps' })

-- Terminal
vim.keymap.set('n', '<leader>t', '<cmd>ToggleTerm direction=vertical size=65<cr>', { desc = 'Terminal' })
vim.keymap.set('n', '<leader>T', '<cmd>ToggleTerm direction=float size=80<cr>', { desc = 'Terminal float' })
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Tools
vim.keymap.set('n', '<leader>y', function()
    require('yazi').yazi()
end, { desc = 'Yazi' })
vim.keymap.set('n', '<leader>gg', function()
    require('lazygit').lazygit()
end, { desc = 'LazyGit' })
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<cr>', { desc = 'Undotree' })

-- Git
vim.keymap.set('n', '<leader>gp', function()
    require('mini.diff').toggle_overlay()
end, { desc = 'Preview diff overlay' })

-- Buffers
vim.keymap.set('n', '<leader>bn', '<cmd>enew<cr>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>bb', '<C-^>', { desc = 'Last buffer' })
vim.keymap.set('n', '<leader>bd', function()
    require('mini.bufremove').delete()
end, { desc = 'Delete buffer' })

-- Windows
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<cr>', { desc = 'Split right' })
vim.keymap.set('n', '<leader>h', '<cmd>split<cr>', { desc = 'Split down' })
vim.keymap.set('n', '<leader>qw', '<cmd>close<cr>', { desc = 'Close window' })
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Navigation
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result (centered)' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Prev search result (centered)' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up (centered)' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down (centered)' })

-- Move lines
vim.keymap.set('n', '<D-k>', ':m .-2<cr>==', { desc = 'Move line up' })
vim.keymap.set('n', '<D-j>', ':m .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set('i', '<D-k>', '<esc>:m .-2<cr>==', { desc = 'Move line up' })
vim.keymap.set('i', '<D-j>', '<esc>:m .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set('v', '<D-k>', ":m '<-2<cr>gv=gv", { desc = 'Move selection up' })
vim.keymap.set('v', '<D-j>', ":m '>+1<cr>gv=gv", { desc = 'Move selection down' })

-- Indenting
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right and reselect' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left and reselect' })
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indent right and reselect' })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Indent left and reselect' })

-- Save / Quit
vim.keymap.set({ 'n', 'i' }, '<D-s>', '<Esc><cmd>w<cr>', { desc = 'Save' })
vim.keymap.set({ 'n', 'i' }, '<leader>w', '<Esc><cmd>w<cr>', { desc = 'Save' })
vim.keymap.set('n', '<leader>qq', '<cmd>q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>q!', '<cmd>q!<cr>', { desc = 'Force quit' })

-- =============================================================================
-- AUTOCOMMANDS
-- =============================================================================
local group = vim.api.nvim_create_augroup('user-autocmds', { clear = true })

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    group = group,
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Creates all intermediate directories in the path
vim.api.nvim_create_autocmd('BufWritePre', {
    group = group,
    callback = function()
        local file = vim.fn.expand('<afile>')
        local dir = vim.fn.fnamemodify(file, ':h')
        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, 'p')
        end
    end,
})

-- Restore trailing newline after formatting
vim.api.nvim_create_autocmd('BufWritePre', {
    group = group,
    callback = function()
        local last_line = vim.fn.line('$')
        if vim.fn.getline(last_line) ~= '' then
            vim.fn.append(last_line, '')
        end
    end,
})

-- Set the working directory based on the argument you passed
vim.api.nvim_create_autocmd('VimEnter', {
    group = group,
    callback = function()
        local arg = vim.fn.argv(0)
        if arg and vim.fn.isdirectory(arg) == 1 then
            vim.cmd.cd(arg)
        end
    end,
})

-- =============================================================================
-- PLUGINS
-- =============================================================================
vim.pack.add({
    { src = 'https://github.com/ellisonleao/gruvbox.nvim' },

    { src = 'https://github.com/nvim-lualine/lualine.nvim' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },

    { src = 'https://github.com/ibhagwan/fzf-lua' },

    { src = 'https://github.com/nvim-mini/mini.nvim' },

    { src = 'https://github.com/j-hui/fidget.nvim' },

    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },

    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('1.*') },

    { src = 'https://github.com/stevearc/conform.nvim' },

    { src = 'https://github.com/akinsho/toggleterm.nvim' },

    { src = 'https://github.com/mikavilpas/yazi.nvim' },
    { src = 'https://github.com/kdheepak/lazygit.nvim' },
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
})

vim.cmd.packadd('nvim.undotree')

-- -----------------------------------------------------------------------------
-- Colorscheme
-- -----------------------------------------------------------------------------
require('gruvbox').setup({ contrast = 'hard' })
vim.cmd.colorscheme('gruvbox')

vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'LineNr', { bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'NONE' })

vim.api.nvim_set_hl(0, 'DiagnosticSignError', { bg = 'NONE', fg = '#ea6962' })
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { bg = 'NONE', fg = '#e3a84e' })
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { bg = 'NONE', fg = '#7daea3' })
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { bg = 'NONE', fg = '#a9b665' })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#282828' })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#282828' })

vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#3c3830', bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })

-- -----------------------------------------------------------------------------
-- Statusline
-- -----------------------------------------------------------------------------
require('lualine').setup({
    options = {
        theme = 'gruvbox',
        globalstatus = true,
    },
    sections = {
        lualine_b = {
            'branch',
            'diff',
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = '● ', warn = '● ', info = '● ', hint = '● ' },
            },
        },
    },
})

-- -----------------------------------------------------------------------------
-- Fuzzy Finder
-- -----------------------------------------------------------------------------
require('fzf-lua').setup({
    files = {
        cwd_prompt = false,
    },
    winopts = {
        height = 0.85,
        width = 0.85,
        preview = {
            layout = 'horizontal',
            ratio = 60,
        },
    },
})

-- -----------------------------------------------------------------------------
-- Mini plugins
-- -----------------------------------------------------------------------------
require('mini.pairs').setup()
require('mini.surround').setup()
require('mini.bufremove').setup()
require('mini.cursorword').setup()
require('mini.indentscope').setup()
require('mini.trailspace').setup()

require('mini.diff').setup({
    view = {
        style = 'sign',
        signs = { add = '▍', change = '▍', delete = '▍' },
        priority = 1,
    },
})

-- -----------------------------------------------------------------------------
-- LSP Progress
-- -----------------------------------------------------------------------------
require('fidget').setup({
    notification = {
        window = {
            winblend = 0,
            border = 'rounded',
        },
    },
})

-- -----------------------------------------------------------------------------
-- LSP
-- -----------------------------------------------------------------------------
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'basedpyright',
        'clangd',
        'bashls',
        'jsonls',
        'marksman',
    },
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
        },
    },
})
vim.lsp.config('basedpyright', {})
vim.lsp.config('clangd', {})
vim.lsp.config('bashls', {
    settings = {
        bashIde = {
            shellcheckPath = '/usr/local/bin/shellcheck',
        },
    },
})
vim.lsp.config('jsonls', {})
vim.lsp.config('marksman', { filetypes = { 'markdown' } })

vim.lsp.config('stylua', { enabled = false })
vim.lsp.config('ruff', { enabled = false })

require('mason-tool-installer').setup({
    ensure_installed = {
        -- Formatters
        'stylua',
        'ruff',
        'shfmt',
        'clang-format',
        'prettierd',

        -- Linters
        'shellcheck',
    },
    auto_update = false,
    run_on_start = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-keymaps', { clear = true }),
    callback = function(event)
        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('grr', function()
            require('fzf-lua').lsp_references()
        end, 'Goto references')
        map('grd', function()
            require('fzf-lua').lsp_definitions()
        end, 'Goto definition')
        map('grt', function()
            require('fzf-lua').lsp_typedefs()
        end, 'Goto type definition')
        map('gri', function()
            require('fzf-lua').lsp_implementations()
        end, 'Goto implementation')
        map('gO', function()
            require('fzf-lua').lsp_document_symbols()
        end, 'Goto document symbols')
        map('gW', function()
            require('fzf-lua').lsp_workspace_symbols()
        end, 'Goto workspace symbols')
        map('<leader>sd', function()
            require('fzf-lua').diagnostics_document()
        end, 'Document diagnostics')
        map('<leader>sD', function()
            require('fzf-lua').diagnostics_workspace()
        end, 'Workspace diagnostics')
        map('gra', function()
            require('fzf-lua').lsp_code_actions()
        end, 'Code action')

        map('grn', vim.lsp.buf.rename, 'Rename symbol')
        map('grl', vim.diagnostic.open_float, 'Line diagnostics')
    end,
})

-- -----------------------------------------------------------------------------
-- Formatting
-- -----------------------------------------------------------------------------
require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'ruff' },
        bash = { 'shfmt' },
        sh = { 'shfmt' },
        c = { 'clang_format' },
        json = { 'prettierd' },
        markdown = { 'prettierd' },
    },
    formatters = {
        stylua = {
            prepend_args = {
                '--indent-type',
                'Spaces',
                '--indent-width',
                '4',
                '--column-width',
                '120',
                '--quote-style',
                'AutoPreferSingle',
            },
        },
    },
})

vim.keymap.set('n', '<leader>f', function()
    require('conform').format({ async = true }, function()
        local last_line = vim.fn.line('$')
        if vim.fn.getline(last_line) ~= '' then
            vim.fn.append(last_line, '')
        end
    end)
end, { desc = 'Format file' })

-- -----------------------------------------------------------------------------
-- Completion
-- -----------------------------------------------------------------------------
require('blink.cmp').setup({
    keymap = {
        preset = 'super-tab',
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<CR>'] = { 'accept', 'fallback' },
    },
    appearance = {
        nerd_font_variant = 'mono',
    },
    completion = {
        documentation = {
            auto_show = false,
            auto_show_delay_ms = 200,
        },
    },
    sources = {
        default = { 'lsp', 'path', 'buffer' },
    },
})

-- -----------------------------------------------------------------------------
-- Terminal
-- -----------------------------------------------------------------------------
require('toggleterm').setup({
    float_opts = { border = 'rounded' },
})

