return {
	"al-kot/typst-preview.nvim",
    keys = {
        { "<leader>ps", function() require("typst-preview").start() end, mode = "n" },
        { "<leader>pe", function() require("typst-preview").stop() end, mode = "n" },
    },
	opts = {

	},
}
