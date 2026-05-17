-- Normal 模式：Alt+j / Alt+k 移動目前這一行
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", {
  desc = "Move current line down",
})

vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", {
  desc = "Move current line up",
  silent = true,
})

-- 只讓 Visual 模式的 y 複製到剪貼簿
vim.keymap.set("v", "y", '"+y', {
  desc = "Yank selection to system clipboard",
})

-- Format 程式碼
vim.keymap.set("n", "<A-F>", function()
  require("conform").format({
    async = true,
    lsp_format = "fallback",
  })
end, {
  desc = "Format file",
})

-- Rename
vim.keymap.set("n", "<F2>", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- 丟掉所有未存修改
vim.keymap.set("n", "<leader>ur", function()
  vim.cmd("bufdo if &modified | edit! | endif")
  vim.notify("Reloaded all modified buffers", vim.log.levels.INFO)
end, {
  desc = "Discard all unsaved buffer changes",
})
