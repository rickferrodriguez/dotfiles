local arrows = require 'icons'
-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.conceallevel = 1 -- or 1 if you prefer less concealment
-- vim.opt.hlsearch = false

vim.opt.syntax = 'enable'
vim.opt.background = 'dark'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.nu = true
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.encoding = 'UTF-8'
-- vim.opt.fileencoding = "utf-8"

-- vim.opt.errorbells = false

-- Show whitespace.
vim.opt.list = true
vim.opt.listchars = { space = '⋅', trail = '⋅', tab = '  ↦' }

-- UI characters.
vim.opt.fillchars = {
    eob = ' ',
    fold = ' ',
    foldclose = arrows.right,
    foldopen = arrows.down,
    foldsep = ' ',
    msgsep = '─',
}

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.wo.signcolumn = 'yes'

-- Add the caracter '@' that can take as part of a rute
vim.opt.isfname:append '@-@'

-- cursor options
vim.o.cursorline = true
vim.opt.guicursor = 'i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150'

-- Give more space for displaying messages.
vim.opt.showcmd = true
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append 'c'

-- Sync clipboard between the OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Disable health checks for these providers.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
