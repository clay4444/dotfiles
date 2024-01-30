-- utf-8 encoding.
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- Do not use relative number.
vim.wo.number = true
vim.wo.relativenumber = false

-- Heightlight current line.
vim.wo.cursorline = true

vim.wo.signcolumn = "yes"

-- Display code guide line on the right.
vim.wo.colorcolumn = "80"

-- Tab key.
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true

-- move length of >> <<
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2

-- Replace tab with blank.
vim.o.expandtab = true
vim.bo.expandtab = true

-- Align with current line when starting a new line.
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- ignorecase when searching unless there is a uppercase.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable heightlight when searching.
vim.o.hlsearch = true

-- Enable search along with type.
vim.o.incsearch = true

vim.o.cmdheight = 2

-- Autoload when file was updated by others.
vim.o.autoread = true
vim.bo.autoread = true

vim.wo.wrap = false

vim.o.whichwrap = '<,>,[,]'

-- Needed when using buffer.
vim.o.hidden = true

vim.o.mouse = "a"

vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- smaller updatetime
vim.o.updatetime = 300

vim.o.timeoutlen = 800

vim.o.splitbelow = true
vim.o.splitright = true

vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- Color theme.
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true

vim.o.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'

vim.o.pumheight = 10

-- Always display tabline.
vim.o.showtabline = 2

-- Use neovim tabline plugin instead.
vim.o.showmode = false
