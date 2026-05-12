-- global boilerplate
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode.' })
vim.keymap.set('v', '<', '<gv', { desc = 'Reselect the selected text after indenting.'})
vim.keymap.set('v', '>', '>gv', { desc = 'Reselect the selected text after indenting.'})

-- lsp, linting, and formatting
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})   -- view documentation from LSPs
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})

