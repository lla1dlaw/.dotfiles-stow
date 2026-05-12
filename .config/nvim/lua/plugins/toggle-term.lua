return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "horizontal",
    open_mapping = [[<C-t>]],
    hide_numbers = true,
  },
  cmd = {
    "ToggleTerm",
    "TermExec",
    "ToggleTermSendCurrentLine",
    "ToggleTermSendVisualLines",
    "ToggleTermSendVisualSelection",
    "ToggleTermOpenAll",
    "ToggleTermCloseAll",
    "ToggleTermToggleAll",
  },
  keys = {
    [[<C-\>]],
    { "<M-=>", [[<Cmd>ToggleTerm direction=float<CR>]], { desc = "Toggle terminal in floating window" } },
    {
      "<M->",
      [[<Cmd>ToggleTerm direction=horizontal<CR>]],
      { desc = "Toggle terminal in horizontal bottom window" },
    },
    -- tmux muscle-memory for fullscreening nvim window
    -- replaced with true-zen.nvim
    -- vim.keymap.set('n', [[<C-a>z]], [[<Cmd>ToggleTermToggleAll<CR>]])
    -- vim.keymap.set('t', [[<C-a>z]], [[<Cmd>tab split<CR>]])
    { "<Esc>", [[<C-\><C-n>]], mode = "t", { desc = "Escape terminal mode" } },
    { "<C-j>", [[<Cmd>wincmd h<CR>]], mode = "t", { desc = "Move focus down one window" } },
    { "<C-k>", [[<Cmd>wincmd k<CR>]], mode = "t", { desc = "Move focus up one window" } },
    { "<C-h>", [[<Cmd>wincmd h<CR>]], mode = "t", { desc = "Move focus left one window" } },
    { "<C-l>", [[<Cmd>wincmd l<CR>]], mode = "t", { desc = "Move focus right one window" } },
    { [[<C-t>]], [[<Cmd>ToggleTerm<CR>]] },
    { "<F12>", [[<Cmd>ToggleTerm<CR>]] },
    { "<F12>", [[<Cmd>ToggleTerm<CR>]], mode = "t" },
    -- { "<leader>H", "<cmd>lua _clx_toggle()<CR>", { desc = "Toggle clx (console HackerNews) floating terminal" } },
    -- { "<leader>G", "<cmd>lua _gitui_toggle()<CR>", { desc = "Toggle gitui floating terminal" } },
  },
}

