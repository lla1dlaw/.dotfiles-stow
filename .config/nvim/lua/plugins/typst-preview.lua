return {
	"al-kot/typst-preview.nvim",
    keys = {
        { "<leader>pt", function() require("typst-preview").toggle() end, mode = "n" },
        { "<leader>pr", function() require("typst-preview").refresh() end, mode = "n" },
        { "<leader>ps", function() require("typst-preview").start() end, mode = "n" },
        { "<leader>pe", function() require("typst-preview").stop() end, mode = "n" },
    },

    opts = {
        preview = {
            max_width = 100,
        },
    }
}
