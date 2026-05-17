-- 行號
vim.opt.number = true
vim.opt.relativenumber = true

-- <leader>
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Diagnostic options
local diagnostic_icons = {
  [vim.diagnostic.severity.ERROR] = "",
  [vim.diagnostic.severity.WARN] = "",
  [vim.diagnostic.severity.INFO] = "",
  [vim.diagnostic.severity.HINT] = "󰌵",
}

vim.diagnostic.config({
  virtual_text = {
    prefix = function(diagnostic)
      return diagnostic_icons[diagnostic.severity] or "●"
    end,
    spacing = 4,
    source = "if_many",
  },
  virtual_lines = false,
  signs = {
    text = diagnostic_icons,
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Indent / Tab
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
