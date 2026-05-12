return {
  {
    "nvim-telescope/telescope.nvim", tag = "v0.2.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fi', function()
      builtin.find_files({
          -- This locates the Neovim config directory automatically
          cwd = vim.fn.stdpath("config"),
          prompt_title = "Neovim Config Files",
          -- Optional: show hidden files like .gitignore or .init.lua
          hidden = false
        })
      end, { desc = 'Telescope: Search Config Files' })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown { }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
