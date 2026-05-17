return {
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerRun",
      "OverseerToggle",
      "OverseerOpen",
      "OverseerClose",
    },
    keys = {
      {
        "<leader>or",
        "<cmd>OverseerRun<CR>",
        desc = "Overseer run task",
      },
      {
        "<leader>ot",
        "<cmd>OverseerToggle bottom<CR>",
        desc = "Overseer toggle task list",
      },
    },
    opts = {},
  },
}
