-- line number configs
vim.opt.number = true
vim.opt.relativenumber = true

-- window split behaviors
vim.opt.splitbelow = true
vim.opt.splitright = true

-- line wrapping
vim.opt.wrap = false

-- spaces instead of tabs
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- synchronize system clipboard
vim.opt.clipboard = "unnamedplus"

-- scroll offset (keep cursor line in middle)
vim.opt.scrolloff = 999

-- visual block change - virtual editing to treat entire screen as a set of cells
vim.opt.virtualedit = "block"

-- incremental - preview changes in realtime *in split*
vim.opt.inccommand = "split"

-- ignore case for extension/plugin commands (which have to be uppercase by default)
vim.opt.ignorecase = true

-- enable wider variety of colors
vim.opt.termguicolors = true

-- set leader key to space
-- g. is a vim global
vim.g.mapleader = " "
