local opt = vim.opt

opt.termguicolors = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 10
opt.sidescrolloff = 10

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.signcolumn = "yes"
opt.colorcolumn = ""
opt.showmatch = true
opt.cmdheight = 0
opt.report = 10
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.fillchars = { eob = " " }

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undodir"

opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 50

opt.autoread = true
opt.autowrite = false

opt.hidden = true
opt.errorbells = false
opt.backspace = "indent,eol,start"
opt.autochdir = false
opt.iskeyword:append("-")
opt.path:append("**")
opt.selection = "inclusive"
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.modifiable = true

opt.splitbelow = true
opt.splitright = true

opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.diffopt:append("linematch:60")
opt.redrawtime = 10000
opt.maxmempattern = 20000

opt.foldlevel = 99

