return {
  "folke/tokyonight.nvim",
  lazy=false,
  name="tokyonight",
  priority=1000,
  transparent=true,
  opts = {
    transparent = true,
  },
  config = function()
    vim.cmd.colorscheme("tokyonight")
  end,
}

