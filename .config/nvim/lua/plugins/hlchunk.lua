return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		chunk = {
			enable = true,
			priority = 0,
			duration = 100,
			delay = 100,
			use_treesitter = false,
		},
		line_num = {
			enable = true,
			use_treesitter = false,
		},
        indent = {
            enable = true,
			use_treesitter = false,
        },
	},
}
