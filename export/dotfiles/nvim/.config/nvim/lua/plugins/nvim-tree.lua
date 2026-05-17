return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<C-b>",
      "<cmd>NvimTreeToggle<CR>",
      desc = "Toggle nvim-tree",
    },
    {
      "<A-h>",
      function()
        local api = require("nvim-tree.api")

        if not api.tree.is_visible() then
          api.tree.open()
        end

        api.tree.focus()
      end,
      desc = "Focus nvim-tree",
    },
    {
      "<A-l>",
      "<cmd>wincmd l<CR>",
      desc = "Move to editor",
    },
  },
  config = function()
    local function open_in_explorer_attach(bufnr)
      local api = require("nvim-tree.api")

      api.map.on_attach.default(bufnr)

      local function opts(desc)
        return {
          desc = "nvim-tree: " .. desc,
          buffer = bufnr,
          noremap = true,
          silent = true,
          nowait = true,
        }
      end

      local function get_linux_default_file_manager()
        if vim.fn.executable("xdg-mime") == 0 then
          return nil
        end

        local result = vim.fn.systemlist({
          "xdg-mime",
          "query",
          "default",
          "inode/directory",
        })

        if vim.v.shell_error ~= 0 then
          return nil
        end

        if not result[1] or result[1] == "" then
          return nil
        end

        return result[1]:lower()
      end

      local function get_linux_file_manager_cmd(path, is_dir)
        local desktop = get_linux_default_file_manager() or ""
        local parent = vim.fn.fnamemodify(path, ":h")

        if desktop:find("nautilus", 1, true) then
          if is_dir then
            return { "nautilus", path }
          else
            return { "nautilus", "--select", path }
          end
        end

        if desktop:find("dolphin", 1, true) then
          if is_dir then
            return { "dolphin", path }
          else
            return { "dolphin", "--select", path }
          end
        end

        if desktop:find("thunar", 1, true) then
          if is_dir then
            return { "thunar", path }
          else
            return { "thunar", "--select", path }
          end
        end

        if desktop:find("nemo", 1, true) then
          if is_dir then
            return { "nemo", path }
          else
            return { "nemo", parent }
          end
        end

        if desktop:find("caja", 1, true) then
          if is_dir then
            return { "caja", path }
          else
            return { "caja", "--select", path }
          end
        end

        if desktop:find("pcmanfm", 1, true) then
          if is_dir then
            return { "pcmanfm", path }
          else
            return { "pcmanfm", "--show-item=" .. path }
          end
        end

        if is_dir then
          return { "xdg-open", path }
        else
          return { "xdg-open", parent }
        end
      end

      local function open_in_file_manager()
        local node = api.tree.get_node_under_cursor()
        if not node or not node.absolute_path then
          return
        end

        local path = node.link_to or node.absolute_path
        local is_dir = vim.fn.isdirectory(path) == 1

        local cmd

        if vim.fn.has("macunix") == 1 then
          if is_dir then
            cmd = { "open", path }
          else
            cmd = { "open", "-R", path }
          end
        elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
          if is_dir then
            cmd = { "explorer.exe", path }
          else
            cmd = { "explorer.exe", "/select,", path }
          end
        elseif vim.fn.has("unix") == 1 then
          cmd = get_linux_file_manager_cmd(path, is_dir)
        else
          vim.notify("Unsupported platform", vim.log.levels.WARN)
          return
        end

        vim.fn.jobstart(cmd, { detach = true })
      end

      vim.keymap.set("n", "<leader>exp", open_in_file_manager, opts("Open in File Manager"))
    end

    require("nvim-tree").setup({
      on_attach = open_in_explorer_attach,
      git = {
        enable = true,
        ignore = false, -- 顯示 .gitignore 忽略的檔案，例如 .env / build / node_modules
        timeout = 400,
      },
      filters = {
        dotfiles = false, -- 顯示 .env / .gitignore / .clangd 這類 dotfiles
        git_ignored = false, -- 顯示 git ignored files
        git_clean = false,
        no_buffer = false,
        custom = {
          "^.git$",
        },
      },
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("nvim-tree.api").tree.open()
      end,
    })
  end,
}
