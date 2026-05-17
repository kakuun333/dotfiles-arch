return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()

      require("nvim-treesitter").install({
        "c",
        "cpp",
        "cmake",
        "lua",
        "vim",
        "vimdoc",
        "query",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "c",
          "cpp",
          "cmake",
          "lua",
          "vim",
        },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
