return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  -- lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {},
    },
  },

  -- mason-tool-installer
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = {
        ----- Linter -----
        "shellcheck", -- shell linter
        ----- Formatter -----
        "stylua", -- Lua formatter
        "prettier", -- JS / TS / HTML / CSS / JSON formatter
        "clang-format", -- C / C++ formatter
        "shfmt", -- shell formatter
        ----- LSP -----
        "lua_ls", -- Lua
        "bashls", -- Bash / shell script
        "clangd", -- C / C++
        -- "cmake-language-server", -- doesn't support python 3.14 <=, https://github.com/regen100/cmake-language-server/issues/106

        ----- Mixed -----
        "gdtoolkit", -- gdscript linter and formatter
        "cmakelang", -- cmake linter and formatter
      },
      run_on_start = true,
    },
  },
}
