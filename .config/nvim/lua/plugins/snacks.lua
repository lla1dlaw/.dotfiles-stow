return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    terminal = {
      -- your terminal configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      shell = "zsh",
    }
  },
  config = function ()
    vim.keymap.set('n', '<leader>q', ':Snacks.terminal.toggle(cmd, opts)')
  end

}
