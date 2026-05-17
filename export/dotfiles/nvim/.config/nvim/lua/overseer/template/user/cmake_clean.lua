local function get_project_root()
  return vim.fs.root(0, { "CMakeLists.txt", ".git" }) or vim.fn.getcwd()
end

return {
  name = "CMake: Clean",
  desc = "Clean CMake build directory using clean target",
  params = {
    build_dir = {
      type = "string",
      name = "Build directory",
      default = "build",
    },
  },
  builder = function(params)
    local root = get_project_root()
    local build_dir = root .. "/" .. params.build_dir

    return {
      name = "CMake: Clean",
      cmd = "cmake",
      args = {
        "--build",
        build_dir,
        "--target",
        "clean",
      },
      cwd = root,
      components = {
        { "on_output_quickfix", open = true },
        "default",
      },
    }
  end,
  condition = {
    callback = function()
      return vim.fs.find("CMakeLists.txt", {
        upward = true,
        type = "file",
        path = vim.fn.getcwd(),
      })[1] ~= nil
    end,
  },
}
