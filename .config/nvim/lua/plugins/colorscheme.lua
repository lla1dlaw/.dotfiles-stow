return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
        vim.cmd.colorscheme("vaporwave")
    end, 
}
-- return {
--   "folke/tokyonight.nvim",
--   lazy=false,
--   name="tokyonight",
--   priority=1000,
--   transparent=true,
--   opts = {
--     transparent = true,
--   },
--   config = function()
--     vim.cmd.colorscheme("tokyonight-night")
--   end,
-- }

