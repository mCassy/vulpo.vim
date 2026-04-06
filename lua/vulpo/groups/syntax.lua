-- Vulpo syntax highlight groups
-- Standard Vim syntax groups (:help group-name)

local M = {}

---Get syntax highlight groups
---@param p VulpoPalette
---@param opts VulpoConfig
---@param fg string
---@return table<string, vim.api.keyset.highlight>
function M.get(p, opts, fg)
  local config = require("vulpo.config")

  return {
    -- Comments
    Comment = { fg = p.comment, italic = config.get_italic("comments") },

    -- Constants
    Constant = { fg = p.red },
    String = { fg = p.green, italic = config.get_italic("strings") },
    Character = { fg = p.green },
    Number = { fg = p.red },
    Boolean = { fg = p.red },
    Float = { fg = p.red },

    -- Identifiers
    Identifier = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    Function = { fg = p.fg_gutter, bold = config.get_bold("functions"), italic = config.get_italic("functions") },

    -- Statements
    Statement = { fg = p.orange, italic = config.get_italic("keywords") },
    Conditional = { fg = p.orange, italic = config.get_italic("keywords") },
    Repeat = { fg = p.orange, italic = config.get_italic("keywords") },
    Label = { fg = p.orange },
    Operator = { fg = fg },
    Keyword = { fg = p.orange, italic = config.get_italic("keywords") },
    Exception = { fg = p.orange, italic = config.get_italic("keywords") },

    -- Preprocessor
    PreProc = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    Include = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    Define = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    Macro = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    PreCondit = { fg = p.fg_gutter, bold = config.get_bold("functions") },

    -- Types
    Type = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    StorageClass = { fg = p.orange },
    Structure = { fg = p.orange },
    Typedef = { fg = p.orange },

    -- Special
    Special = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    SpecialChar = { fg = p.cyan_green },
    Tag = { fg = p.orange, underline = true },
    Delimiter = { fg = fg },
    SpecialComment = { fg = p.teal, italic = config.get_italic("comments") },
    Debug = { fg = p.red },

    -- Text styling
    Bold = { bold = true },
    Italic = { fg = p.olive, bold = true },
    Underlined = { underline = true },

    -- Ignore and errors
    Ignore = { fg = p.gray },
    Error = { fg = p.red, bold = true, reverse = true },
    Todo = { fg = p.green, bold = true, reverse = true },

    -- HTML links
    htmlBold = { bold = true },
    htmlItalic = { fg = p.olive, bold = true },
    htmlLink = { fg = p.link, underline = true },
    htmlH1 = { fg = p.teal, bold = true },
    htmlH2 = { fg = p.teal, bold = true },
    htmlH3 = { fg = p.teal },
    htmlH4 = { fg = p.teal },
    htmlH5 = { fg = p.teal },
    htmlH6 = { fg = p.teal },

    -- Markdown
    markdownH1 = { fg = p.teal, bold = true },
    markdownH2 = { fg = p.teal, bold = true },
    markdownH3 = { fg = p.teal },
    markdownH4 = { fg = p.teal },
    markdownH5 = { fg = p.teal },
    markdownH6 = { fg = p.teal },
    markdownHeadingDelimiter = { fg = p.orange },
    markdownCode = { fg = p.green },
    markdownCodeBlock = { fg = p.green },
    markdownCodeDelimiter = { fg = p.gray },
    markdownBlockquote = { fg = p.gray },
    markdownListMarker = { fg = p.orange },
    markdownOrderedListMarker = { fg = p.orange },
    markdownRule = { fg = p.gray },
    markdownHeadingRule = { fg = p.gray },
    markdownUrlDelimiter = { fg = p.gray },
    markdownLinkDelimiter = { fg = p.gray },
    markdownLinkTextDelimiter = { fg = p.gray },
    markdownUrl = { fg = p.link, underline = true },
    markdownUrlTitleDelimiter = { fg = p.green },
    markdownLinkText = { fg = p.teal },
    markdownIdDeclaration = { fg = p.teal },

    -- Filetype-specific (when ft_mods is enabled)
    -- C
    cStorageClass = opts.ft_mods and { fg = p.orange } or nil,
    cEnum = opts.ft_mods and { fg = p.orange } or nil,
    cTypedef = opts.ft_mods and { fg = p.orange } or nil,
    cMacroName = opts.ft_mods and { fg = p.fg_gutter, bold = config.get_bold("functions") } or nil,
    cDataStructureKeyword = opts.ft_mods and { fg = p.fg_gutter, bold = config.get_bold("functions") } or nil,

    -- Vim
    vimHiAttrib = opts.ft_mods and { fg = p.red } or nil,
    vimCommentTitle = opts.ft_mods and { fg = p.teal, underline = true } or nil,

    -- XML
    xmlTag = { fg = p.orange },
    xmlTagName = { fg = p.orange },
    xmlEndTag = { fg = p.orange },
    xmlAttrib = { fg = p.fg_gutter },

    -- JSON
    jsonKeyword = { fg = p.teal },
    jsonString = { fg = p.green },
    jsonBoolean = { fg = p.red },
    jsonNumber = { fg = p.red },
    jsonNull = { fg = p.red },
    jsonQuote = { fg = fg },

    -- YAML
    yamlKey = { fg = p.teal },
    yamlAnchor = { fg = p.purple },
    yamlAlias = { fg = p.purple },
    yamlDocumentHeader = { fg = p.green },

    -- TOML
    tomlTable = { fg = p.teal },
    tomlKey = { fg = p.fg_gutter },
    tomlString = { fg = p.green },
    tomlBoolean = { fg = p.red },
    tomlInteger = { fg = p.red },
    tomlFloat = { fg = p.red },

    -- Shell
    shVariable = { fg = p.fg_gutter },
    shShellVariables = { fg = p.fg_gutter },
    shStatement = { fg = p.orange },
    shFunctionKey = { fg = p.orange },

    -- Lua
    luaFunction = { fg = p.orange },
    luaTable = { fg = fg },
    luaIn = { fg = p.orange },

    -- Python
    pythonBuiltin = { fg = p.teal },
    pythonBuiltinObj = { fg = p.teal },
    pythonBuiltinFunc = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    pythonFunction = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    pythonDecorator = { fg = p.purple },
    pythonInclude = { fg = p.orange },
    pythonImport = { fg = p.orange },
    pythonOperator = { fg = p.orange },
    pythonStatement = { fg = p.orange },

    -- Ruby
    rubyClass = { fg = p.orange },
    rubyModule = { fg = p.orange },
    rubyDefine = { fg = p.orange },
    rubyFunction = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    rubyInclude = { fg = p.orange },
    rubyAttribute = { fg = p.teal },
    rubySymbol = { fg = p.green },
    rubyStringDelimiter = { fg = p.green },

    -- Go
    goPackage = { fg = p.orange },
    goImport = { fg = p.orange },
    goFunc = { fg = p.orange },
    goType = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    goTypeName = { fg = p.fg_gutter, bold = config.get_bold("functions") },

    -- Rust
    rustKeyword = { fg = p.orange },
    rustModPath = { fg = p.fg_gutter },
    rustFuncName = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    rustType = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    rustDerive = { fg = p.purple },
    rustAttribute = { fg = p.purple },

    -- JavaScript/TypeScript
    javaScriptFunction = { fg = p.orange },
    javaScriptIdentifier = { fg = p.fg_gutter },
    javaScriptNull = { fg = p.red },
    javaScriptNumber = { fg = p.red },
    typescriptImport = { fg = p.orange },
    typescriptExport = { fg = p.orange },
    typescriptVariable = { fg = p.orange },
    typescriptBraces = { fg = fg },
    typescriptPredefinedType = { fg = p.teal },
    typescriptInterfaceName = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    typescriptClassName = { fg = p.fg_gutter, bold = config.get_bold("functions") },
  }
end

return M
