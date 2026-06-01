return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = { },
  config = function() 
    require("typescript-tools").setup ({ 
      on_attach = function(client, bufnr)
        -- This disables LSP semantic tokens so Treesitter can color your HTML/JSX
        client.server_capabilities.semanticTokensProvider = nil
      end,
      settings = {
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        }
      } 
    })
  end,
}
