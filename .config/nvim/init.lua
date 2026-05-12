-- /home/llaidlaw/.config/nvim/init.lua
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mfussenegger/nvim-ansible" }
})
require("core.options")
require("core.keymaps")

-- setup lsp


-- must be called after keymaps and lsp-config (need leader keys)
require("config.lazy") 


