return {
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      require("Comment").setup(opts)

      local api = require("Comment.api")
      local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

      -- Normal 模式：Ctrl+/ 註解目前這一行
      vim.keymap.set("n", "<C-/>", api.toggle.linewise.current, {
        desc = "Toggle comment current line",
      })

      -- Visual 模式：選取多行後 Ctrl+/ 註解選取範圍
      vim.keymap.set("x", "<C-/>", function()
        vim.api.nvim_feedkeys(esc, "nx", false)
        api.locked("toggle.linewise")(vim.fn.visualmode())
      end, {
        desc = "Toggle comment selection",
      })
    end,
  },
}
