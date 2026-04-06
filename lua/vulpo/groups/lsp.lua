-- Vulpo LSP highlight groups
-- LSP diagnostics and semantic tokens

local M = {}

---Get LSP highlight groups
---@param p VulpoPalette
---@param opts VulpoConfig
---@param fg string
---@return table<string, vim.api.keyset.highlight>
function M.get(p, opts, fg)
  local config = require("vulpo.config")
  local util = require("vulpo.util")

  return {
    -- Diagnostics
    DiagnosticError = { fg = p.error },
    DiagnosticWarn = { fg = p.warning },
    DiagnosticInfo = { fg = p.info },
    DiagnosticHint = { fg = p.hint },
    DiagnosticOk = { fg = p.green },

    DiagnosticVirtualTextError = { fg = p.error, bg = util.blend(p.error, p.bg, 0.1) },
    DiagnosticVirtualTextWarn = { fg = p.warning, bg = util.blend(p.warning, p.bg, 0.1) },
    DiagnosticVirtualTextInfo = { fg = p.info, bg = util.blend(p.info, p.bg, 0.1) },
    DiagnosticVirtualTextHint = { fg = p.hint, bg = util.blend(p.hint, p.bg, 0.1) },
    DiagnosticVirtualTextOk = { fg = p.green, bg = util.blend(p.green, p.bg, 0.1) },

    DiagnosticUnderlineError = { undercurl = true, sp = p.error },
    DiagnosticUnderlineWarn = { undercurl = true, sp = p.warning },
    DiagnosticUnderlineInfo = { undercurl = true, sp = p.info },
    DiagnosticUnderlineHint = { undercurl = true, sp = p.hint },
    DiagnosticUnderlineOk = { undercurl = true, sp = p.green },

    DiagnosticFloatingError = { fg = p.error },
    DiagnosticFloatingWarn = { fg = p.warning },
    DiagnosticFloatingInfo = { fg = p.info },
    DiagnosticFloatingHint = { fg = p.hint },
    DiagnosticFloatingOk = { fg = p.green },

    DiagnosticSignError = { fg = p.error },
    DiagnosticSignWarn = { fg = p.warning },
    DiagnosticSignInfo = { fg = p.info },
    DiagnosticSignHint = { fg = p.hint },
    DiagnosticSignOk = { fg = p.green },

    -- Deprecated
    DiagnosticDeprecated = { strikethrough = true, fg = p.gray },
    DiagnosticUnnecessary = { fg = p.gray },

    -- LSP references
    LspReferenceText = { bg = p.bg_visual },
    LspReferenceRead = { bg = p.bg_visual },
    LspReferenceWrite = { bg = p.bg_visual, bold = true },

    -- LSP signature
    LspSignatureActiveParameter = { fg = p.orange, bold = true },

    -- LSP code lens
    LspCodeLens = { fg = p.gray },
    LspCodeLensSeparator = { fg = p.gray },

    -- LSP inlay hints
    LspInlayHint = { fg = p.gray, bg = util.blend(p.gray, p.bg, 0.1) },

    -- LSP info window
    LspInfoBorder = { fg = p.border },

    -- Semantic tokens
    -- Types
    ["@lsp.type.class"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@lsp.type.comment"] = { fg = p.comment, italic = config.get_italic("comments") },
    ["@lsp.type.decorator"] = { fg = p.purple },
    ["@lsp.type.enum"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@lsp.type.enumMember"] = { fg = p.red },
    ["@lsp.type.function"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@lsp.type.interface"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@lsp.type.keyword"] = { fg = p.orange, italic = config.get_italic("keywords") },
    ["@lsp.type.macro"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@lsp.type.method"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@lsp.type.namespace"] = { fg = p.fg_gutter },
    ["@lsp.type.number"] = { fg = p.red },
    ["@lsp.type.operator"] = { fg = fg },
    ["@lsp.type.parameter"] = { fg = fg, italic = config.get_italic("parameters") },
    ["@lsp.type.property"] = { fg = p.fg_gutter },
    ["@lsp.type.regexp"] = { fg = p.cyan_green },
    ["@lsp.type.string"] = { fg = p.green, italic = config.get_italic("strings") },
    ["@lsp.type.struct"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@lsp.type.type"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@lsp.type.typeParameter"] = { fg = p.fg_gutter },
    ["@lsp.type.variable"] = { fg = fg, italic = config.get_italic("variables") },

    -- Modifiers
    ["@lsp.mod.abstract"] = { italic = true },
    ["@lsp.mod.async"] = { italic = true },
    ["@lsp.mod.declaration"] = {},
    ["@lsp.mod.defaultLibrary"] = { fg = p.teal },
    ["@lsp.mod.definition"] = {},
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.documentation"] = { italic = config.get_italic("comments") },
    ["@lsp.mod.modification"] = {},
    ["@lsp.mod.readonly"] = {},
    ["@lsp.mod.static"] = {},

    -- Type + Modifier combinations
    ["@lsp.typemod.class.defaultLibrary"] = { fg = p.teal },
    ["@lsp.typemod.enum.defaultLibrary"] = { fg = p.teal },
    ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = p.red },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = p.teal, bold = config.get_bold("functions") },
    ["@lsp.typemod.keyword.async"] = { fg = p.orange, italic = true },
    ["@lsp.typemod.macro.defaultLibrary"] = { fg = p.teal },
    ["@lsp.typemod.method.defaultLibrary"] = { fg = p.teal, bold = config.get_bold("functions") },
    ["@lsp.typemod.operator.injected"] = { fg = fg },
    ["@lsp.typemod.string.injected"] = { fg = p.green },
    ["@lsp.typemod.struct.defaultLibrary"] = { fg = p.teal },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = p.teal },
    ["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = p.teal },
    ["@lsp.typemod.variable.callable"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = p.teal },
    ["@lsp.typemod.variable.globalScope"] = { fg = p.fg_gutter },
    ["@lsp.typemod.variable.injected"] = { fg = fg },
    ["@lsp.typemod.variable.static"] = { fg = p.red },
  }
end

return M
