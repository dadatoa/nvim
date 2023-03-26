local g = vim.g
local o = vim.o

o.exrc = true
o.mouse = "a"

o.termguicolors = true

-- basic gui settings
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = false
o.incsearch = true
o.hlsearch = false
o.cmdheight = 2
o.guicursor = ""

-- Indicates which mode editor is currently in eg: --> Insert
o.showmode = false

-- Do not save when switching buffers
o.hidden = true

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- better editing experience
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true
o.wrap = false
o.errorbells = false

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.undodir = "/home/adnan/.vim/undodir"

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- auto session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Preserve view while jumping
--o.jumpoptions = 'view'

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "
