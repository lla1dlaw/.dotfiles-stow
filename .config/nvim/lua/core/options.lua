-- tab behavior
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- line config
vim.o.relativenumber=true
vim.o.number=true
vim.o.cursorline=true
vim.o.wrap=false

-- add filetype support for vim doge
vim.cmd([[filetype plugin on]])
vim.cmd([[filetype indent on]])
vim.cmd([[syntax on]])
