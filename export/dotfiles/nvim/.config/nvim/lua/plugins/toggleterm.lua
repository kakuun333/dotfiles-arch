return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      {
        "<C-`>",
        "<cmd>ToggleTerm<CR>",
        desc = "Toggle terminal",
      },
    },
    opts = {
      size = 15,
      direction = "horizontal",
      shade_terminals = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },
}
