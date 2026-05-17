-- CMake Audo Reload with overseer.nvim
local cmake_reload_group = vim.api.nvim_create_augroup("CMakeAutoReload", {
  clear = true,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = cmake_reload_group,
  pattern = "CMakeLists.txt",
  callback = function(args)
    local ok, overseer = pcall(require, "overseer")
    if not ok then
      vim.notify("overseer.nvim not loaded", vim.log.levels.WARN)
      return
    end

    local cmake_file = vim.fs.normalize(args.file)
    local cmake_dir = vim.fs.dirname(cmake_file)

    -- 找專案根目錄；優先用 .git，沒有就用目前 CMakeLists.txt 所在目錄
    local root = vim.fs.root(cmake_dir, { ".git" }) or cmake_dir

    overseer.run_task({
      name = "CMake: Reload",
      cwd = root,
      first = true,
      disallow_prompt = true,
      params = {
        build_type = "Debug",
        build_dir = "build",
      },
    }, function(task, err)
      if err then
        vim.notify("CMake reload failed: " .. err, vim.log.levels.ERROR)
        return
      end

      if task then
        vim.notify("CMake reload started", vim.log.levels.INFO)
      end
    end)
  end,
})

-- go to definition
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = {
      buffer = event.buf,
      silent = true,
    }

    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
  end,
})
