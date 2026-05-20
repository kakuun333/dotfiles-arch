return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = { "<C-`>" },
    opts = {
      size = 15,
      direction = "horizontal",
      shade_terminals = true,
      start_in_insert = true,
      close_on_exit = true,
      open_mapping = [[<C-`>]],
      terminal_mappings = false,
      on_open = function(term)
        local close = function()
          vim.cmd("ToggleTerm")
        end

        vim.keymap.set({ "n", "t" }, "<C-j>", close, {
          buffer = term.bufnr,
          desc = "Close terminal",
          silent = true,
        })

        vim.keymap.set("t", "<C-`>", close, {
          buffer = term.bufnr,
          desc = "Toggle terminal",
          silent = true,
        })
      end,
    },
  },
}
