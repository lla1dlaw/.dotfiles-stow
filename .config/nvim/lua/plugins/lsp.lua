return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim", 
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "clangd", 
          "bashls", 
          "pyright", 
          "ansiblels",
          "ts_ls",
        },
        automatic_installation = true,
        automatic_enable = true,
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = { },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
  },
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
	      "shellcheck",
        "tree-sitter-cli",
			},
			auto_update = true,
			run_on_start = true,
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"ruff",
				"prettier",
				"stylua",
        "ansible-lint",
        "eslint-lsp",
			},
			automatic_installation = true,
			handlers = {},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		-- opts = { sources = { -- anything not available with Mason }, },
	},
}
