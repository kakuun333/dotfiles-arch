return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<C-p>",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
          })
        end,
        desc = "Telescope find files",
      },

      -- vim.keymap.set("n", "<C+S+f>", builtin.live_grep, { desc = "Telescope live grep" })
      {
        "<C-f>",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Telescope live grep",
      },
    },
    config = function()
      require("telescope").setup()
    end,
  },
}
