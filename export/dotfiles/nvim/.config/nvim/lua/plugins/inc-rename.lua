return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    keys = {
      {
        "<F2>",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename symbol",
      },
    },
    opts = {
      post_hook = function()
        vim.schedule(function()
          vim.cmd("silent! wa")
          vim.notify("Rename completed and buffers saved", vim.log.levels.INFO)
        end)
      end,
    },
  },
}
