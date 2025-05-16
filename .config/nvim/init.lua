vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
-- vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.clipboard = "unnamedplus"

vim.opt.mouse = "a"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Allow gf to open non-existing files
vim.keymap.set('', 'gf', ':edit <cfile><CR>', { noremap = false })

-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv', { noremap = true })
vim.keymap.set('v', '>', '>gv', { noremap = true })

-- Toggle off search highlight when ESC is pressed
vim.keymap.set('n', '<Esc>', ':noh<CR>', { noremap = true })

-- Go to tab by number
vim.keymap.set('n', '<leader>1', '1gt', { noremap = true })
vim.keymap.set('n', '<leader>2', '2gt', { noremap = true })
vim.keymap.set('n', '<leader>3', '3gt', { noremap = true })
vim.keymap.set('n', '<leader>4', '4gt', { noremap = true })
vim.keymap.set('n', '<leader>5', '5gt', { noremap = true })
vim.keymap.set('n', '<leader>6', '6gt', { noremap = true })
vim.keymap.set('n', '<leader>7', '7gt', { noremap = true })
vim.keymap.set('n', '<leader>8', '8gt', { noremap = true })
vim.keymap.set('n', '<leader>9', '9gt', { noremap = true })

-- Map <Esc> to exit terminal-mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
-- Open terminal in a new tab in insert mode
vim.keymap.set('n', '<leader>t', ':tabnew | term<CR>i', { noremap = true, silent = true })

require("config.lazy")

vim.cmd.colorscheme "catppuccin"
