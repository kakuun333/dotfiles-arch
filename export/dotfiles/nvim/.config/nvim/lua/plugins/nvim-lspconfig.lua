return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local bufnr = event.buf

          local function opts(desc)
            return {
              buffer = bufnr,
              silent = true,
              desc = desc,
            }
          end

          -- 顯示所有 code action，例如 quickfix / refactor / source action
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
        end,
      })

      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
          "--header-insertion=iwyu",
        },
      })

      vim.lsp.enable("clangd")
    end,
  },
}
