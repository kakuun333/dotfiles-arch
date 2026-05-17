-- ~/.config/nvim/lua/config/highlights.lua
-- MonokaiKaku highlights converted from MonokaiKaku.icls

local C = {
  bg = "#272822",
  fg = "#f8f8f2",
  fg_alt = "#f8f8f0",

  cursorline = "#3e3d32",
  selection = "#575959",
  gutter = "#272822",
  guide = "#464741",
  search = "#5f5f00",

  comment = "#75715e",
  keyword = "#f92672",
  string = "#e6db74",
  number = "#ae81ff",
  func_call = "#a6e22e",
  func_decl = "#a6e22e",
  class = "#4ec9b0",
  variable = "#96d3f3",
  parameter = "#fd971f",
  global = "#ff7373",
  macro = "#c4baff",
  enum_member = "#cdedb5",
  operator = "#f92672",
  overloaded_operator = "#ff5ea7",

  error = "#ff6767",
  warn = "#f4bf75",
  info = "#66d9ef",
  hint = "#a6e22e",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function set_hl()
  -- Editor UI ---------------------------------------------------------------
  hl("Normal", { fg = C.fg, bg = C.bg })
  hl("NormalNC", { fg = C.fg, bg = C.bg })
  hl("NormalFloat", { fg = C.fg, bg = C.bg })
  hl("FloatBorder", { fg = C.guide, bg = C.bg })
  hl("SignColumn", { fg = C.fg, bg = C.gutter })
  hl("EndOfBuffer", { fg = C.bg, bg = C.bg })

  hl("CursorLine", { bg = C.cursorline })
  hl("CursorLineNr", { fg = C.fg_alt, bg = C.cursorline, bold = true })
  hl("LineNr", { fg = C.fg, bg = C.gutter })

  hl("Visual", { bg = C.selection })
  hl("Search", { fg = C.fg, bg = C.search })
  hl("IncSearch", { fg = C.bg, bg = C.keyword })
  hl("CurSearch", { fg = C.bg, bg = C.keyword })

  hl("Whitespace", { fg = C.guide })
  hl("NonText", { fg = C.guide })
  hl("SpecialKey", { fg = C.guide })
  hl("WinSeparator", { fg = C.guide, bg = C.bg })

  hl("Pmenu", { fg = C.fg, bg = "#3e3d32" })
  hl("PmenuSel", { fg = C.bg, bg = C.func_call })
  hl("PmenuSbar", { bg = C.cursorline })
  hl("PmenuThumb", { bg = C.guide })

  -- Vim syntax groups -------------------------------------------------------
  hl("Comment", { fg = C.comment, italic = true })
  hl("String", { fg = C.string })
  hl("Character", { fg = C.string })
  hl("Number", { fg = C.number })
  hl("Boolean", { fg = C.number })
  hl("Float", { fg = C.number })

  hl("Keyword", { fg = C.keyword })
  hl("Statement", { fg = C.keyword })
  hl("Conditional", { fg = C.keyword })
  hl("Repeat", { fg = C.keyword })
  hl("Label", { fg = C.keyword })
  hl("Exception", { fg = C.keyword })
  hl("Operator", { fg = C.operator })

  hl("Function", { fg = C.func_call })
  hl("Identifier", { fg = C.variable })
  hl("Type", { fg = C.class })
  hl("Structure", { fg = C.class })
  hl("Typedef", { fg = C.func_call, italic = true })
  hl("StorageClass", { fg = C.keyword })

  hl("PreProc", { fg = C.keyword })
  hl("Include", { fg = C.keyword })
  hl("Define", { fg = C.keyword })
  hl("Macro", { fg = C.macro })

  hl("Constant", { fg = C.number })
  hl("Special", { fg = C.number })
  hl("SpecialChar", { fg = C.number })
  hl("Delimiter", { fg = C.operator })

  -- Tree-sitter general groups ---------------------------------------------
  hl("@comment", { fg = C.comment, italic = true })
  hl("@comment.documentation", { fg = C.comment, italic = true })
  hl("@string", { fg = C.string })
  hl("@string.escape", { fg = C.number })
  hl("@string.special", { fg = C.string })
  hl("@character", { fg = C.string })
  hl("@number", { fg = C.number })
  hl("@boolean", { fg = C.keyword })
  hl("@float", { fg = C.number })

  hl("@keyword", { fg = C.keyword })
  hl("@keyword.type", { fg = C.keyword })
  hl("@keyword.function", { fg = C.keyword })
  hl("@keyword.return", { fg = C.keyword })
  hl("@keyword.conditional", { fg = C.keyword })
  hl("@keyword.repeat", { fg = C.keyword })
  hl("@keyword.operator", { fg = C.keyword })
  hl("@keyword.import", { fg = C.keyword })
  hl("@keyword.directive", { fg = C.keyword })
  hl("@keyword.directive.define", { fg = C.keyword })

  hl("@operator", { fg = C.operator })
  hl("@punctuation.delimiter", { fg = C.operator })
  hl("@punctuation.bracket", { fg = C.fg })
  hl("@punctuation.special", { fg = C.operator })

  hl("@function", { fg = C.func_decl })
  hl("@function.call", { fg = C.func_call })
  hl("@function.method", { fg = C.func_decl })
  hl("@function.method.call", { fg = C.func_call })
  hl("@function.builtin", { fg = C.func_call, italic = true })
  hl("@function.macro", { fg = C.macro })
  hl("@constructor", { fg = C.class })

  hl("@type", { fg = C.class })
  hl("@type.builtin", { fg = C.func_call, italic = true })
  hl("@type.definition", { fg = C.func_call, italic = true })
  hl("@module", { fg = C.fg })
  hl("@namespace", { fg = C.fg })

  hl("@variable", { fg = C.variable })
  hl("@variable.builtin", { fg = C.parameter, italic = true })
  hl("@variable.parameter", { fg = C.parameter, italic = true })
  hl("@variable.member", { fg = C.variable })
  hl("@property", { fg = C.variable })
  hl("@field", { fg = C.variable }) -- older capture name

  hl("@constant", { fg = C.fg })
  hl("@constant.builtin", { fg = C.number })
  hl("@constant.macro", { fg = C.macro })
  hl("@label", { fg = C.keyword })
  hl("@attribute", { fg = C.keyword })
  hl("@tag", { fg = C.keyword })
  hl("@tag.attribute", { fg = C.func_decl })
  hl("@tag.delimiter", { fg = C.operator })

  -- Tree-sitter C / C++ specific -------------------------------------------
  -- @constant.builtin.cpp links to @constant.builtin
  hl("@constant.builtin.cpp", { fg = C.keyword })
  hl("@type.cpp", { fg = C.class })
  hl("@type.c", { fg = C.class })
  hl("@type.builtin.cpp", { fg = C.keyword, italic = true })
  hl("@type.builtin.c", { fg = C.func_call, italic = true })
  hl("@variable.cpp", { fg = C.variable })
  hl("@variable.c", { fg = C.variable })
  hl("@variable.parameter.cpp", { fg = C.parameter, italic = true })
  hl("@variable.parameter.c", { fg = C.parameter, italic = true })
  hl("@variable.member.cpp", { fg = C.variable })
  hl("@function.cpp", { fg = C.func_decl })
  hl("@function.c", { fg = C.func_decl })
  hl("@function.call.cpp", { fg = C.func_call })
  hl("@function.call.c", { fg = C.func_call })
  hl("@function.method.cpp", { fg = C.func_decl })
  hl("@function.method.call.cpp", { fg = C.func_call })
  hl("@function.macro.cpp", { fg = C.macro })
  hl("@function.macro.c", { fg = C.macro })
  hl("@constant.macro.cpp", { fg = C.macro })
  hl("@constant.macro.c", { fg = C.macro })
  hl("@keyword.directive.cpp", { fg = C.keyword })
  hl("@keyword.directive.c", { fg = C.keyword })
  hl("@keyword.cpp", { fg = C.keyword })
  hl("@operator.cpp", { fg = C.operator })
  hl("@operator.c", { fg = C.operator })

  -- LSP semantic tokens, especially clangd ---------------------------------
  hl("@lsp.type.class", { fg = C.class })
  hl("@lsp.type.struct", { fg = C.class })
  hl("@lsp.type.enum", { fg = C.class })
  hl("@lsp.type.enumMember", { fg = C.enum_member })
  hl("@lsp.type.type", { fg = C.class })
  hl("@lsp.type.typeParameter", { fg = C.class })
  hl("@lsp.type.parameter", { fg = C.parameter, italic = true })
  hl("@lsp.type.variable", { fg = C.variable })
  hl("@lsp.type.property", { fg = C.variable })
  hl("@lsp.type.function", { fg = C.func_call })
  hl("@lsp.type.method", { fg = C.func_decl })
  hl("@lsp.type.macro", { fg = C.macro })
  hl("@lsp.type.namespace", { fg = C.fg })
  hl("@lsp.type.operator", { fg = C.overloaded_operator })

  hl("@lsp.type.class.cpp", { fg = C.class })
  hl("@lsp.type.struct.cpp", { fg = C.class })
  hl("@lsp.type.enum.cpp", { fg = C.class })
  hl("@lsp.type.enumMember.cpp", { fg = C.enum_member })
  hl("@lsp.type.type.cpp", { fg = C.class })
  hl("@lsp.type.typeParameter.cpp", { fg = C.class })
  hl("@lsp.type.parameter.cpp", { fg = C.parameter, italic = true })
  hl("@lsp.type.variable.cpp", { fg = C.variable })
  hl("@lsp.type.property.cpp", { fg = C.variable })
  hl("@lsp.type.function.cpp", { fg = C.func_call })
  hl("@lsp.type.method.cpp", { fg = C.func_decl })
  hl("@lsp.type.macro.cpp", { fg = C.macro })
  hl("@lsp.type.namespace.cpp", { fg = C.fg })
  hl("@lsp.type.operator.cpp", { fg = C.overloaded_operator })
  hl("@lsp.type.modifier.cpp", { fg = C.keyword })

  -- Common clangd semantic token modifiers
  hl("@lsp.typemod.function.declaration.cpp", { fg = C.func_decl })
  hl("@lsp.typemod.method.declaration.cpp", { fg = C.func_decl })
  hl("@lsp.typemod.variable.globalScope.cpp", { fg = C.global, italic = true })
  hl("@lsp.typemod.variable.static.cpp", { fg = C.variable, italic = true })
  hl("@lsp.typemod.property.static.cpp", { fg = C.variable, italic = true })
  hl("@lsp.typemod.macro.defaultLibrary.cpp", { fg = C.macro })
  hl("@lsp.typemod.type.defaultLibrary.cpp", { fg = C.class })
  hl("@lsp.mod.deprecated", { strikethrough = true })

  -- Diagnostics -------------------------------------------------------------
  local diagnostic_icons = {
    [vim.diagnostic.severity.ERROR] = "",
    [vim.diagnostic.severity.WARN] = "",
    [vim.diagnostic.severity.INFO] = "",
    [vim.diagnostic.severity.HINT] = "󰌵",
  }

  vim.diagnostic.config({
    virtual_text = {
      prefix = function(diagnostic)
        return diagnostic_icons[diagnostic.severity] or "●"
      end,
      spacing = 4,
      source = "if_many",
    },
    virtual_lines = false,
    signs = {
      text = diagnostic_icons,
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })

  hl("DiagnosticError", { fg = C.error })
  hl("DiagnosticWarn", { fg = C.warn })
  hl("DiagnosticInfo", { fg = C.info })
  hl("DiagnosticHint", { fg = C.hint })
  hl("DiagnosticVirtualTextError", { fg = C.error, bg = "NONE" })
  hl("DiagnosticVirtualTextWarn", { fg = C.warn, bg = "NONE" })
  hl("DiagnosticVirtualTextInfo", { fg = C.info, bg = "NONE" })
  hl("DiagnosticVirtualTextHint", { fg = C.hint, bg = "NONE" })
  hl("DiagnosticSignError", { fg = C.error, bg = C.gutter })
  hl("DiagnosticSignWarn", { fg = C.warn, bg = C.gutter })
  hl("DiagnosticSignInfo", { fg = C.info, bg = C.gutter })
  hl("DiagnosticSignHint", { fg = C.hint, bg = C.gutter })
  hl("DiagnosticUnderlineError", { sp = C.error, undercurl = true })
  hl("DiagnosticUnderlineWarn", { sp = C.warn, undercurl = true })
  hl("DiagnosticUnderlineInfo", { sp = C.info, undercurl = true })
  hl("DiagnosticUnderlineHint", { sp = C.hint, undercurl = true })

  -- Telescope / Trouble / nvim-tree nice defaults --------------------------
  hl("TelescopeNormal", { fg = C.fg, bg = C.bg })
  hl("TelescopeBorder", { fg = C.guide, bg = C.bg })
  hl("TelescopeSelection", { fg = C.fg, bg = C.cursorline })
  hl("TelescopeMatching", { fg = C.string, bold = true })
  hl("TroubleNormal", { fg = C.fg, bg = C.bg })
  hl("NvimTreeNormal", { fg = C.fg, bg = C.bg })
  hl("NvimTreeFolderName", { fg = C.func_call })
  hl("NvimTreeOpenedFolderName", { fg = C.func_decl, bold = true })
  hl("NvimTreeGitDirty", { fg = C.warn })
end

set_hl()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("MonokaiKakuHighlights", { clear = true }),
  callback = set_hl,
})
