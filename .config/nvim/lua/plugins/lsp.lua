return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},

		config = function()
			local servers = {
				"lua_ls",
				"rust_analyzer",
				"clangd",
				"bashls",
				"basedpyright",
				"ansiblels",
				"slint_lsp",
				"html",
			}

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			-- Use the new vim.lsp API to set up global capabilities and enable servers
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})
			vim.lsp.enable(servers)
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
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
