local function get_project_root()
  return vim.fs.root(0, { "CMakeLists.txt", ".git" }) or vim.fn.getcwd()
end

local function sh_escape(value)
  return vim.fn.shellescape(value)
end

return {
  name = "CMake: Configure",
  desc = "Configure CMake project",
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
    local compile_commands = build_dir .. "/compile_commands.json"
    local root_compile_commands = root .. "/compile_commands.json"

    local command = table.concat({
      "cmake" .. " -S " .. sh_escape(root) .. " -B " .. sh_escape(build_dir) .. " -DCMAKE_BUILD_TYPE=" .. sh_escape(
        params.build_type
      ) .. " -DCMAKE_EXPORT_COMPILE_COMMANDS=ON",

      -- 讓 clangd 在專案根目錄也找得到 compile_commands.json
      "ln -sf " .. sh_escape(compile_commands) .. " " .. sh_escape(root_compile_commands),
    }, " && ")

    return {
      name = "CMake: Configure " .. params.build_type,
      cmd = "bash",
      args = {
        "-lc",
        command,
      },
      cwd = root,
      components = {
        { "on_output_quickfix", open = false },
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
