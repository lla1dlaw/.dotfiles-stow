return {
    "Mofiqul/vscode.nvim",
    priority = 1000,
    config = function()
        require("vscode").setup({
            terminal_colors = false,
        })
        vim.cmd.colorscheme("vscode")
    end,
}
-- return {
--     "olimorris/onedarkpro.nvim",
--     priority = 1000, -- Ensure it loads first
--     config = function()
--         vim.cmd.colorscheme("vaporwave")
--     end, 
-- }
