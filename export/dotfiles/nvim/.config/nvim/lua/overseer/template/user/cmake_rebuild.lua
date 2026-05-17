local function get_project_root()
  return vim.fs.root(0, { "CMakeLists.txt", ".git" }) or vim.fn.getcwd()
end

local function default_jobs()
  if vim.fn.executable("nproc") == 1 then
    local result = vim.fn.systemlist("nproc")[1]
    if result ~= nil and result ~= "" then
      return result
    end
  end

  return "4"
end

return {
  name = "CMake: Rebuild",
  desc = "Clean first, then build CMake project",
  params = {
    build_dir = {
      type = "string",
      name = "Build directory",
      default = "build",
    },
    target = {
      type = "string",
      name = "Target, empty = all",
      optional = true,
      default = "",
    },
    jobs = {
      type = "string",
      name = "Parallel jobs",
      default = default_jobs(),
    },
  },
  builder = function(params)
    local root = get_project_root()
    local build_dir = root .. "/" .. params.build_dir

    local args = {
      "--build",
      build_dir,
      "--clean-first",
    }

    if params.target ~= nil and params.target ~= "" then
      table.insert(args, "--target")
      table.insert(args, params.target)
    end

    if params.jobs ~= nil and params.jobs ~= "" then
      table.insert(args, "-j")
      table.insert(args, params.jobs)
    end

    return {
      name = "CMake: Rebuild",
      cmd = "cmake",
      args = args,
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
