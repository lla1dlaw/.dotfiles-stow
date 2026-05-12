return {
  {
    "MaximilianLloyd/ascii.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter", 
    enabled = true,
    init = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "MaximilianLloyd/ascii.nvim",
    },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local ascii_neovim = require("ascii")
      vim.api.nvim_set_hl(0, "AlphaHeaderCustom", { fg = "#90e0f0", bold = true })
      dashboard.section.header.opts.hl = "AlphaHeaderCustom"
      -- Now you can access the specific art piece
      dashboard.section.header.val = ascii_neovim.get_random("computers", "linux")
      alpha.setup(dashboard.opts)
    end,
  }
}
