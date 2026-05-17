-- Formatter 執行插件
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },

    formatters_by_ft = {
      lua = { "stylua" },

      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      json = { "prettier" },

      c = { "clang_format" },
      cpp = { "clang_format" },

      python = { "isort", "black" },

      sh = { "shfmt" },
      bash = { "shfmt" },
    },
  },
}
