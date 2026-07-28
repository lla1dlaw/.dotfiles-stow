return {
	"CRAG666/code_runner.nvim",
	cmd = { 
        "RunCode",
        "RunFile",
        "RunProject",
        "RunClose",
        "CRFiletype",
        "CRProjects" 
    },
    opts = {
		-- your config (mode, filetype, ...) goes here
        mode = "toggleterm",
        focus = false,

	},
    keys = {
        { "<leader>r", "<cmd>RunCode<CR>", desc = "Run Code" },
    }

}
