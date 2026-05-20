-- lua/config/options.lua

local opt = vim.opt

opt.confirm = true                                  -- Confirm to save changes before exiting modified buffer

opt.number = true                                   -- Show absolute line numbers
opt.relativenumber = false                          -- Disable relative line numbers

-- indentation
opt.tabstop = 4                                     -- Display tabs as 4 spaces
opt.softtabstop = 4                                 -- Treat tabs as 4 spaces when editing
opt.shiftwidth = 4                                  -- Indentation width for auto-indent
opt.expandtab = true                                -- Convert tabs to spaces
opt.smartindent = false                             -- Disable smart auto-indenting
opt.autoindent = false                              -- Don't copy indent from previous line
opt.wrap = false                                    -- Disable line wrapping

-- backup and undo
opt.swapfile = false                                -- Don't create swap files
opt.backup = false                                  -- Don't create backup files
opt.undodir = vim.fn.stdpath("data") .. "/undodir"  -- Set undo directory to a standard location
opt.undofile = true                                 -- Enable persistent undo

-- UI
opt.cursorline = true                               -- Highlight the current line
opt.scrolloff = 8                                   -- Keep 8 lines visible around cursor
opt.sidescrolloff = 8                               -- Keep 8 columns visible when scrolling

opt.termguicolors = true                            -- Enable true color support
opt.showmode = false                                -- Don't show mode since lualine will handle it
opt.signcolumn = "yes"                              -- Always show the sign column

-- window splits
opt.splitbelow = true                               -- Open horizontal splits below the current window
opt.splitright = true                               -- Open vertical splits to the right of the current window

-- misc
opt.ignorecase = true                               -- Ignore case in search
opt.smartcase = true                                -- Smart case sensitivity in sear

opt.clipboard = "unnamedplus"                       -- Use system clipboard
