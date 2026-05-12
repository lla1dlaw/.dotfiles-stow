-- tab behavior
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- line config
vim.o.relativenumber=true
vim.o.number=true
vim.o.cursorline=true
vim.o.wrap=false

-- add filetype support for vim doge
vim.cmd([[filetype plugin on]])
vim.cmd([[filetype indent on]])
vim.cmd([[syntax on]])
