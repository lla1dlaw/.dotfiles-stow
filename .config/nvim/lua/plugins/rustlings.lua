return {
  "martifaj/rustlings.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- optional
  },
  opts = {
    rustlings_path = nil,

    keymaps = {
      next = "<leader>rn", -- Set to false to disable
    },

    progress = {
      show_in_statusline = true,
    },

    telescope = {
      show_completed = true,
      show_pending = true,
      layout_strategy = "vertical",
    },
  },
}
