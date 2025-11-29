-- set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General
vim.o.backup = false
vim.o.mouse = 'a'
vim.o.writebackup = false
vim.o.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.o.autoread = true
vim.o.undofile = true
vim.o.swapfile = false

vim.o.shada = "'100,<50,s10,:1000,/100,@100,h" -- Limit what is stored in ShaDa file

-- Editing
vim.o.expandtab = true -- Convert tabs to Spaces
vim.o.formatoptions = 'rqnl1j' -- Improve comment editing
vim.o.ignorecase = true
vim.o.incsearch = true --Show search results while typing
vim.o.infercase = true -- Infer letter cases for a richer built-in keyword completion
vim.o.shiftwidth = 4
vim.o.smartcase = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]] -- Better format for special characters
vim.o.completeopt = 'menuone,noselect,fuzzy' -- Use fuzzy matching for built-in completion
-- vim.o.pumheight = 15
-- vim.o.pumborder = 'rounded'

-- UI Settigns
vim.o.termguicolors = true
vim.o.conceallevel = 1 -- or 1 if you prefer less concealment
vim.o.relativenumber = true
vim.o.number = true -- Show line numbers
vim.o.nu = true
vim.o.syntax = 'enable'
vim.o.showmatch = true
vim.o.hlsearch = true
vim.o.wrap = false
vim.o.splitbelow = true -- Horizontal splits will be below
vim.o.splitright = true -- Vertical splits will be to the right
vim.o.diffopt = 'internal,filler,closeoff,linematch:60' -- new diff option
vim.o.cursorline = true -- Enable highlighting of the current line
vim.o.cursorlineopt = 'both'
vim.o.scrolloff = 8
vim.o.guicursor = 'i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150' -- Custom cursor color, like vscode color
vim.o.colorcolumn = '80'
vim.wo.signcolumn = 'yes'

-- Behavior Settigns
vim.o.errorbells = false
vim.o.hidden = true
vim.o.backspace = 'indent,eol,start'
vim.o.encoding = 'UTF-8'
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between the OS and Neovim.
vim.o.modifiable = true
vim.o.inccommand = 'split'
vim.opt.path:append '@-@' -- Add the caracter '@' that can take as part of a rute
vim.opt.iskeyword:append '-' -- Treat dash as part of word
vim.opt.path:append '**' -- include subdirectories in search

-- Give more space for displaying messages.
vim.o.showcmd = true
vim.o.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime = 50
-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append 'c'

-- Disable health checks for these providers.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
