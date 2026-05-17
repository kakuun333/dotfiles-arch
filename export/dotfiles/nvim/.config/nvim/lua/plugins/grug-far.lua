-- 替換文字插件
return {
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        "<C-h>",
        function()
          require("grug-far").open()
        end,
        desc = "Search and replace",
      },
    },
    config = function()
      require("grug-far").setup()
    end,
  },
}
