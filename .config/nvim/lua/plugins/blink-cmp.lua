return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {

		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},

		-- New top-level cmdline configuration
		cmdline = {
			sources = function()
				local type = vim.fn.getcmdtype()
				-- Search forward and backward
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				-- Commands
				if type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
		},

		completion = {
			accept = { auto_brackets = { enabled = true } },
			trigger = {
				show_on_keyword = true,
				show_on_trigger_character = true,
				show_on_insert_on_trigger_character = true,
			},

			documentation = {
				auto_show = true,
				-- auto_show_delay_ms = 250,
				treesitter_highlighting = true,
				window = { border = "rounded" },
			},

			list = {
				selection = {
					preselect = function(ctx)
						return ctx.mode ~= "cmdline"
					end,
					auto_insert = function(ctx)
						return ctx.mode == "cmdline"
					end,
				},
			},

			menu = {
				border = "rounded",

				cmdline_position = function()
					if vim.g.ui_cmdline_pos ~= nil then
						local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
						return { pos[1] - 1, pos[2] }
					end
					local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
					return { vim.o.lines - height, 0 }
				end,

				draw = {
					columns = {
						{ "kind_icon", "label", gap = 1 },
						{ "kind" },
					},
					components = {
						kind_icon = {
							text = function(item)
								local kind = require("lspkind").symbol_map[item.kind] or ""
								return kind .. " "
							end,
							highlight = "CmpItemKind",
						},
						label = {
							text = function(item)
								return item.label
							end,
							highlight = "CmpItemAbbr",
						},
						kind = {
							text = function(item)
								return item.kind
							end,
							highlight = "CmpItemKind",
						},
					},
				},
			},
		},

		-- My super-TAB configuration
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<TAB>"] = { "accept", "fallback" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-up>"] = { "scroll_documentation_up", "fallback" },
			["<C-down>"] = { "scroll_documentation_down", "fallback" },
		},

		-- Experimental signature help support
		signature = {
			enabled = true,
			window = { border = "rounded" },
			trigger = {
				enabled = true,
				show_on_insert_on_trigger_character = true,
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			-- "cmdline" function REMOVED from here

			providers = {
				lsp = {
					score_offset = 0,
				},
				path = {
					min_keyword_length = 0,
				},
				snippets = {
					min_keyword_length = 1,
				},
				buffer = {
					min_keyword_length = 5,
					max_items = 5,
				},
			},
		},
	},
}
