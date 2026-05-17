local function get_project_root()
  return vim.fs.root(0, { "CMakeLists.txt", ".git" }) or vim.fn.getcwd()
end

return {
  name = "CMake: Reload",
  desc = "Reload CMake project by running configure again",
  params = {
    build_type = {
      type = "enum",
      name = "Build type",
      choices = {
        "Debug",
        "Release",
        "RelWithDebInfo",
        "MinSizeRel",
      },
      default = "Debug",
    },
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
      name = "CMake: Reload",
      cmd = "cmake",
      args = {
        "-S",
        root,
        "-B",
        build_dir,
        "-DCMAKE_BUILD_TYPE=" .. params.build_type,
        "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
      },
      cwd = root,
      components = {
        {
          "unique",
          replace = true,
        },
        {
          "on_output_quickfix",
          open = false,
        },
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
