-- lua/config/options.lua

local opt = vim.opt

opt.confirm = true                  -- Confirm to save changes before exiting modified buffer

opt.number = true                   -- Show absolute line numbers
opt.relativenumber = false          -- Disable relative line numbers

opt.tabstop = 4                     -- Display tabs as 4 spaces
opt.softtabstop = 4                 -- Treat tabs as 4 spaces when editing
opt.shiftwidth = 4                  -- Indentation width for auto-indent
opt.expandtab = true                -- Convert tabs to spaces

opt.autoindent = true               -- Continue indent from previous line
opt.smartindent = true              -- Enable smart auto-indenting

opt.cursorline = true               -- Highlight the current line
opt.scrolloff = 8                   -- Keep 8 lines visible around cursor
opt.sidescrolloff = 8               -- Keep 8 columns visible when scrolling

opt.wrap = false                    -- Disable line wrapping

opt.ignorecase = true               -- Ignore case in search
opt.smartcase = true                -- Smart case sensitivity in search

opt.clipboard = "unnamedplus"       -- Use system clipboard
opt.termguicolors = true            -- Enable true color support
opt.showmode = false                -- Don't show mode since lualine will handle it
