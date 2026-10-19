return {
  "subnut/nvim-ghost.nvim",
  lazy = false, -- nvim-ghost requires starting with neovim to listen for the browser
  config = function()
    -- Create the specific augroup required by nvim-ghost
    local ghost_group = vim.api.nvim_create_augroup("nvim_ghost_user_autocommands", { clear = true })

    -- Set the filetype when the domain matches typst.app
    vim.api.nvim_create_autocmd("User", {
      group = ghost_group,
      pattern = "*typst.app",
      callback = function()
        vim.bo.filetype = "typst"
      end,
    })
  end,
}
