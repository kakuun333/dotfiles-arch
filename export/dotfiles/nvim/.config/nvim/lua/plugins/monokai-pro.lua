return {
  "loctvl842/monokai-pro.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local monokai_pro = require("monokai-pro")
    monokai_pro.setup({})
    vim.cmd.colorscheme("monokai-pro")
    monokai_pro.set_filter("classic")
  end,
}
