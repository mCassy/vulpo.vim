-- Vulpo plugin highlight groups
-- Support for popular Neovim plugins

local M = {}

---Get plugin highlight groups
---@param p VulpoPalette
---@param opts VulpoConfig
---@param fg string
---@return table<string, vim.api.keyset.highlight>
function M.get(p, opts, fg)
  local util = require("vulpo.util")
  local transparent = opts.transparent

  -- Float background for plugins
  local float_bg = transparent and p.none or p.bg_float
  local dark_bg = transparent and p.none or p.bg_dark
  local medium_bg = transparent and p.none or p.bg_medium

  return {
    -- ============================================
    -- Telescope
    -- ============================================
    TelescopeNormal = { fg = fg, bg = float_bg },
    TelescopeBorder = { fg = p.border, bg = float_bg },
    TelescopeTitle = { fg = p.teal, bg = float_bg, bold = true },
    TelescopePromptNormal = { fg = fg, bg = medium_bg },
    TelescopePromptBorder = { fg = p.border, bg = medium_bg },
    TelescopePromptTitle = { fg = p.teal, bg = medium_bg, bold = true },
    TelescopePromptPrefix = { fg = p.orange },
    TelescopePromptCounter = { fg = p.gray },
    TelescopeResultsNormal = { fg = fg, bg = float_bg },
    TelescopeResultsBorder = { fg = p.border, bg = float_bg },
    TelescopeResultsTitle = { fg = p.teal, bg = float_bg, bold = true },
    TelescopePreviewNormal = { fg = fg, bg = float_bg },
    TelescopePreviewBorder = { fg = p.border, bg = float_bg },
    TelescopePreviewTitle = { fg = p.teal, bg = float_bg, bold = true },
    TelescopeSelection = { fg = p.fg_gutter, bg = p.bg_visual, bold = true },
    TelescopeSelectionCaret = { fg = p.orange, bg = p.bg_visual },
    TelescopeMultiSelection = { fg = p.purple, bg = p.bg_visual },
    TelescopeMultiIcon = { fg = p.purple },
    TelescopeMatching = { fg = p.orange, bold = true },

    -- ============================================
    -- nvim-tree
    -- ============================================
    NvimTreeNormal = { fg = fg, bg = dark_bg },
    NvimTreeNormalNC = { fg = fg, bg = dark_bg },
    NvimTreeRootFolder = { fg = p.teal, bold = true },
    NvimTreeFolderName = { fg = p.teal_light },
    NvimTreeFolderIcon = { fg = p.teal },
    NvimTreeOpenedFolderName = { fg = p.teal_light, bold = true },
    NvimTreeEmptyFolderName = { fg = p.gray },
    NvimTreeSymlinkFolderName = { fg = p.teal_light },
    NvimTreeIndentMarker = { fg = p.indent_guide },
    NvimTreeWinSeparator = { fg = dark_bg, bg = dark_bg },
    NvimTreeGitDirty = { fg = p.git_change },
    NvimTreeGitNew = { fg = p.git_add },
    NvimTreeGitDeleted = { fg = p.git_delete },
    NvimTreeGitStaged = { fg = p.green },
    NvimTreeGitMerge = { fg = p.orange },
    NvimTreeGitRenamed = { fg = p.purple },
    NvimTreeGitIgnored = { fg = p.gray },
    NvimTreeSpecialFile = { fg = p.orange, underline = true },
    NvimTreeImageFile = { fg = p.purple },
    NvimTreeSymlink = { fg = p.purple },
    NvimTreeExecFile = { fg = p.green, bold = true },
    NvimTreeBookmark = { fg = p.orange },
    NvimTreeModifiedFile = { fg = p.git_change },

    -- ============================================
    -- Neo-tree
    -- ============================================
    NeoTreeNormal = { fg = fg, bg = dark_bg },
    NeoTreeNormalNC = { fg = fg, bg = dark_bg },
    NeoTreeRootName = { fg = p.teal, bold = true },
    NeoTreeDirectoryName = { fg = p.teal_light },
    NeoTreeDirectoryIcon = { fg = p.teal },
    NeoTreeFileName = { fg = fg },
    NeoTreeFileIcon = { fg = fg },
    NeoTreeFileNameOpened = { fg = fg, bold = true },
    NeoTreeIndentMarker = { fg = p.indent_guide },
    NeoTreeExpander = { fg = p.gray },
    NeoTreeSymbolicLinkTarget = { fg = p.purple },
    NeoTreeModified = { fg = p.git_change },
    NeoTreeDimText = { fg = p.gray },
    NeoTreeFilterTerm = { fg = p.orange, bold = true },
    NeoTreeMessage = { fg = p.gray, italic = true },
    NeoTreeDotfile = { fg = p.gray },
    NeoTreeHiddenByName = { fg = p.gray },
    NeoTreeWindowsHidden = { fg = p.gray },
    NeoTreeCursorLine = { bg = p.bg_visual },
    NeoTreeWinSeparator = { fg = dark_bg, bg = dark_bg },
    NeoTreeStatusLine = { fg = fg, bg = dark_bg },
    NeoTreeStatusLineNC = { fg = p.gray, bg = dark_bg },
    NeoTreeVertSplit = { fg = dark_bg, bg = dark_bg },
    NeoTreeEndOfBuffer = { fg = dark_bg },
    NeoTreeSignColumn = { fg = fg, bg = dark_bg },

    -- Neo-tree git status
    NeoTreeGitAdded = { fg = p.git_add },
    NeoTreeGitConflict = { fg = p.red, bold = true },
    NeoTreeGitDeleted = { fg = p.git_delete },
    NeoTreeGitIgnored = { fg = p.gray },
    NeoTreeGitModified = { fg = p.git_change },
    NeoTreeGitUnstaged = { fg = p.git_change },
    NeoTreeGitUntracked = { fg = p.git_add },
    NeoTreeGitStaged = { fg = p.green },
    NeoTreeGitRenamed = { fg = p.purple },

    -- Neo-tree tabs
    NeoTreeTabActive = { fg = p.fg_gutter, bg = p.gray, bold = true },
    NeoTreeTabInactive = { fg = p.gray, bg = dark_bg },
    NeoTreeTabSeparatorActive = { fg = p.green, bg = p.gray },
    NeoTreeTabSeparatorInactive = { fg = dark_bg, bg = dark_bg },

    -- Neo-tree float
    NeoTreeFloatBorder = { fg = p.border, bg = float_bg },
    NeoTreeFloatTitle = { fg = p.teal, bg = float_bg, bold = true },
    NeoTreeFloatNormal = { fg = fg, bg = float_bg },
    NeoTreeTitleBar = { fg = p.teal, bg = float_bg, bold = true },

    -- Neo-tree preview
    NeoTreePreview = { fg = fg, bg = float_bg },

    -- Neo-tree git status (detailed for git_status source)
    NeoTreeGitStatusAdded = { fg = p.git_add },
    NeoTreeGitStatusDeleted = { fg = p.git_delete },
    NeoTreeGitStatusModified = { fg = p.git_change },
    NeoTreeGitStatusRenamed = { fg = p.purple },
    NeoTreeGitStatusConflict = { fg = p.red, bold = true },
    NeoTreeGitStatusUntracked = { fg = p.git_add },
    NeoTreeGitStatusIgnored = { fg = p.gray },
    NeoTreeGitStatusStaged = { fg = p.green },
    NeoTreeGitStatusUnstaged = { fg = p.git_change },

    -- ============================================
    -- GitSigns
    -- ============================================
    GitSignsAdd = { fg = p.git_add },
    GitSignsChange = { fg = p.git_change },
    GitSignsDelete = { fg = p.git_delete },
    GitSignsAddNr = { fg = p.git_add },
    GitSignsChangeNr = { fg = p.git_change },
    GitSignsDeleteNr = { fg = p.git_delete },
    GitSignsAddLn = { bg = util.blend(p.git_add, p.bg, 0.2) },
    GitSignsChangeLn = { bg = util.blend(p.git_change, p.bg, 0.2) },
    GitSignsDeleteLn = { bg = util.blend(p.git_delete, p.bg, 0.2) },
    GitSignsAddPreview = { fg = p.git_add, bg = p.bg_light },
    GitSignsDeletePreview = { fg = p.git_delete, bg = p.bg_light },
    GitSignsCurrentLineBlame = { fg = p.gray, italic = true },
    GitSignsAddInline = { bg = util.blend(p.git_add, p.bg, 0.3) },
    GitSignsChangeInline = { bg = util.blend(p.git_change, p.bg, 0.3) },
    GitSignsDeleteInline = { bg = util.blend(p.git_delete, p.bg, 0.3) },
    GitSignsStagedAdd = { fg = util.darken(p.git_add, 0.3) },
    GitSignsStagedChange = { fg = util.darken(p.git_change, 0.3) },
    GitSignsStagedDelete = { fg = util.darken(p.git_delete, 0.3) },
    GitSignsStagedAddNr = { fg = util.darken(p.git_add, 0.3) },
    GitSignsStagedChangeNr = { fg = util.darken(p.git_change, 0.3) },
    GitSignsStagedDeleteNr = { fg = util.darken(p.git_delete, 0.3) },

    -- ============================================
    -- nvim-cmp
    -- ============================================
    CmpItemAbbr = { fg = fg },
    CmpItemAbbrDeprecated = { fg = p.gray, strikethrough = true },
    CmpItemAbbrMatch = { fg = p.orange, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = p.orange, bold = true },
    CmpItemKind = { fg = p.teal },
    CmpItemMenu = { fg = p.gray },
    CmpItemKindClass = { fg = p.fg_gutter },
    CmpItemKindColor = { fg = p.purple },
    CmpItemKindConstant = { fg = p.red },
    CmpItemKindConstructor = { fg = p.fg_gutter },
    CmpItemKindEnum = { fg = p.fg_gutter },
    CmpItemKindEnumMember = { fg = p.red },
    CmpItemKindEvent = { fg = p.purple },
    CmpItemKindField = { fg = p.fg_gutter },
    CmpItemKindFile = { fg = p.teal },
    CmpItemKindFolder = { fg = p.teal },
    CmpItemKindFunction = { fg = p.fg_gutter },
    CmpItemKindInterface = { fg = p.fg_gutter },
    CmpItemKindKeyword = { fg = p.orange },
    CmpItemKindMethod = { fg = p.fg_gutter },
    CmpItemKindModule = { fg = p.fg_gutter },
    CmpItemKindOperator = { fg = fg },
    CmpItemKindProperty = { fg = p.fg_gutter },
    CmpItemKindReference = { fg = p.teal },
    CmpItemKindSnippet = { fg = p.green },
    CmpItemKindStruct = { fg = p.fg_gutter },
    CmpItemKindText = { fg = fg },
    CmpItemKindTypeParameter = { fg = p.fg_gutter },
    CmpItemKindUnit = { fg = p.red },
    CmpItemKindValue = { fg = p.red },
    CmpItemKindVariable = { fg = fg },
    CmpGhostText = { fg = p.gray, italic = true },

    -- ============================================
    -- blink.cmp
    -- ============================================
    BlinkCmpMenu = { fg = fg, bg = float_bg },
    BlinkCmpMenuBorder = { fg = p.border, bg = float_bg },
    BlinkCmpMenuSelection = { fg = p.fg_gutter, bg = p.bg_visual, bold = true },
    BlinkCmpScrollBarThumb = { bg = p.gray },
    BlinkCmpScrollBarGutter = { bg = float_bg },
    BlinkCmpLabel = { fg = fg, bg = float_bg },
    BlinkCmpLabelDeprecated = { fg = p.gray, bg = float_bg, strikethrough = true },
    BlinkCmpLabelMatch = { fg = p.orange, bg = float_bg, bold = true },
    BlinkCmpLabelDetail = { fg = p.gray, bg = float_bg },
    BlinkCmpLabelDescription = { fg = p.gray, bg = float_bg },
    BlinkCmpSource = { fg = p.gray, bg = float_bg },
    BlinkCmpKind = { fg = p.teal, bg = float_bg },
    BlinkCmpKindClass = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindColor = { fg = p.purple, bg = float_bg },
    BlinkCmpKindConstant = { fg = p.red, bg = float_bg },
    BlinkCmpKindConstructor = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindEnum = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindEnumMember = { fg = p.red, bg = float_bg },
    BlinkCmpKindEvent = { fg = p.purple, bg = float_bg },
    BlinkCmpKindField = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindFile = { fg = p.teal, bg = float_bg },
    BlinkCmpKindFolder = { fg = p.teal, bg = float_bg },
    BlinkCmpKindFunction = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindInterface = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindKeyword = { fg = p.orange, bg = float_bg },
    BlinkCmpKindMethod = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindModule = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindOperator = { fg = fg, bg = float_bg },
    BlinkCmpKindProperty = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindReference = { fg = p.teal, bg = float_bg },
    BlinkCmpKindSnippet = { fg = p.green, bg = float_bg },
    BlinkCmpKindStruct = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindText = { fg = fg, bg = float_bg },
    BlinkCmpKindTypeParameter = { fg = p.fg_gutter, bg = float_bg },
    BlinkCmpKindUnit = { fg = p.red, bg = float_bg },
    BlinkCmpKindValue = { fg = p.red, bg = float_bg },
    BlinkCmpKindVariable = { fg = fg, bg = float_bg },
    BlinkCmpGhostText = { fg = p.gray, italic = true },
    BlinkCmpDoc = { fg = fg, bg = float_bg },
    BlinkCmpDocBorder = { fg = p.border, bg = float_bg },
    BlinkCmpDocSeparator = { fg = p.border, bg = float_bg },
    BlinkCmpDocCursorLine = { bg = p.bg_visual },
    BlinkCmpSignatureHelp = { fg = fg, bg = float_bg },
    BlinkCmpSignatureHelpBorder = { fg = p.border, bg = float_bg },
    BlinkCmpSignatureHelpActiveParameter = { fg = p.orange, bold = true },

    -- ============================================
    -- Lazy.nvim
    -- ============================================
    LazyButton = { fg = fg, bg = medium_bg },
    LazyButtonActive = { fg = p.fg_gutter, bg = p.bg_visual, bold = true },
    LazyComment = { fg = p.gray },
    LazyCommit = { fg = p.green },
    LazyCommitIssue = { fg = p.orange },
    LazyCommitScope = { fg = p.teal, italic = true },
    LazyCommitType = { fg = p.teal, bold = true },
    LazyDir = { fg = p.teal_light },
    LazyH1 = { fg = p.teal, bold = true },
    LazyH2 = { fg = p.orange, bold = true },
    LazyLocal = { fg = p.purple },
    LazyNoCond = { fg = p.red },
    LazyNormal = { fg = fg, bg = float_bg },
    LazyProgressDone = { fg = p.green },
    LazyProgressTodo = { fg = p.gray },
    LazyProp = { fg = p.fg_gutter },
    LazyReasonCmd = { fg = p.orange },
    LazyReasonEvent = { fg = p.purple },
    LazyReasonFt = { fg = p.teal },
    LazyReasonImport = { fg = p.fg_gutter },
    LazyReasonKeys = { fg = p.green },
    LazyReasonPlugin = { fg = p.fg_gutter },
    LazyReasonRequire = { fg = p.fg_gutter },
    LazyReasonRuntime = { fg = p.fg_gutter },
    LazyReasonSource = { fg = p.fg_gutter },
    LazyReasonStart = { fg = p.green },
    LazySpecial = { fg = p.orange },
    LazyTaskError = { fg = p.red },
    LazyTaskOutput = { fg = fg },
    LazyUrl = { fg = p.link, underline = true },
    LazyValue = { fg = p.green },

    -- ============================================
    -- Mason
    -- ============================================
    MasonNormal = { fg = fg, bg = float_bg },
    MasonHeader = { fg = p.bg, bg = p.teal, bold = true },
    MasonHeaderSecondary = { fg = p.bg, bg = p.orange, bold = true },
    MasonHighlight = { fg = p.teal },
    MasonHighlightBlock = { fg = p.bg, bg = p.teal },
    MasonHighlightBlockBold = { fg = p.bg, bg = p.teal, bold = true },
    MasonHighlightBlockBoldSecondary = { fg = p.bg, bg = p.orange, bold = true },
    MasonHighlightSecondary = { fg = p.orange },
    MasonMuted = { fg = p.gray },
    MasonMutedBlock = { fg = p.bg, bg = p.gray },
    MasonMutedBlockBold = { fg = p.bg, bg = p.gray, bold = true },

    -- ============================================
    -- Which-key
    -- ============================================
    WhichKey = { fg = p.orange },
    WhichKeyBorder = { fg = p.border, bg = float_bg },
    WhichKeyDesc = { fg = fg },
    WhichKeyFloat = { bg = float_bg },
    WhichKeyNormal = { fg = fg, bg = float_bg },
    WhichKeyGroup = { fg = p.teal },
    WhichKeySeparator = { fg = p.gray },
    WhichKeyValue = { fg = p.gray },
    WhichKeyTitle = { fg = p.teal, bg = float_bg, bold = true },

    -- ============================================
    -- Indent Blankline
    -- ============================================
    IndentBlanklineChar = { fg = p.indent_guide, nocombine = true },
    IndentBlanklineContextChar = { fg = p.indent_guide_active, nocombine = true },
    IndentBlanklineContextStart = { sp = p.indent_guide_active, underline = true },
    IndentBlanklineSpaceChar = { fg = p.indent_guide, nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = p.indent_guide, nocombine = true },
    -- v3
    IblIndent = { fg = p.indent_guide, nocombine = true },
    IblScope = { fg = p.indent_guide_active, nocombine = true },
    IblWhitespace = { fg = p.indent_guide, nocombine = true },

    -- ============================================
    -- Bufferline
    -- ============================================
    -- Base backgrounds for transparency support
    -- dark_bg = inactive tabs, transparent and p.none or p.bg
    -- medium_bg = visible but not selected
    -- Normal bg = selected tab
    BufferLineFill = { bg = dark_bg },
    BufferLineBackground = { fg = p.gray, bg = dark_bg },
    BufferLineBuffer = { fg = p.gray, bg = dark_bg },
    BufferLineBufferSelected = { fg = fg, bg = transparent and p.none or p.bg, bold = true },
    BufferLineBufferVisible = { fg = p.fg_muted, bg = medium_bg },
    BufferLineCloseButton = { fg = p.gray, bg = dark_bg },
    BufferLineCloseButtonSelected = { fg = p.red, bg = transparent and p.none or p.bg },
    BufferLineCloseButtonVisible = { fg = p.gray, bg = medium_bg },
    BufferLineIndicatorSelected = { fg = p.teal, bg = transparent and p.none or p.bg },
    BufferLineIndicatorVisible = { fg = p.gray, bg = medium_bg },
    BufferLineModified = { fg = p.git_change, bg = dark_bg },
    BufferLineModifiedSelected = { fg = p.git_change, bg = transparent and p.none or p.bg },
    BufferLineModifiedVisible = { fg = p.git_change, bg = medium_bg },
    BufferLineSeparator = { fg = dark_bg, bg = dark_bg },
    BufferLineSeparatorSelected = { fg = dark_bg, bg = transparent and p.none or p.bg },
    BufferLineSeparatorVisible = { fg = dark_bg, bg = medium_bg },
    BufferLineTab = { fg = p.gray, bg = dark_bg },
    BufferLineTabSelected = { fg = fg, bg = transparent and p.none or p.bg, bold = true },
    BufferLineTabClose = { fg = p.red, bg = dark_bg },
    BufferLineTabSeparator = { fg = dark_bg, bg = dark_bg },
    BufferLineTabSeparatorSelected = { fg = dark_bg, bg = transparent and p.none or p.bg },
    BufferLineNumbers = { fg = p.gray, bg = dark_bg },
    BufferLineNumbersSelected = { fg = p.orange, bg = transparent and p.none or p.bg, bold = true },
    BufferLineNumbersVisible = { fg = p.gray, bg = medium_bg },
    BufferLineDuplicate = { fg = p.gray, bg = dark_bg, italic = true },
    BufferLineDuplicateSelected = { fg = p.fg_muted, bg = transparent and p.none or p.bg, italic = true },
    BufferLineDuplicateVisible = { fg = p.gray, bg = medium_bg, italic = true },
    BufferLinePick = { fg = p.orange, bg = dark_bg, bold = true },
    BufferLinePickSelected = { fg = p.orange, bg = transparent and p.none or p.bg, bold = true },
    BufferLinePickVisible = { fg = p.orange, bg = medium_bg, bold = true },
    BufferLineDiagnostic = { fg = p.gray, bg = dark_bg },
    BufferLineDiagnosticSelected = { fg = p.gray, bg = transparent and p.none or p.bg },
    BufferLineDiagnosticVisible = { fg = p.gray, bg = medium_bg },
    BufferLineError = { fg = p.error, bg = dark_bg },
    BufferLineErrorSelected = { fg = p.error, bg = transparent and p.none or p.bg },
    BufferLineErrorVisible = { fg = p.error, bg = medium_bg },
    BufferLineErrorDiagnostic = { fg = p.error, bg = dark_bg },
    BufferLineErrorDiagnosticSelected = { fg = p.error, bg = transparent and p.none or p.bg },
    BufferLineErrorDiagnosticVisible = { fg = p.error, bg = medium_bg },
    BufferLineWarning = { fg = p.warning, bg = dark_bg },
    BufferLineWarningSelected = { fg = p.warning, bg = transparent and p.none or p.bg },
    BufferLineWarningVisible = { fg = p.warning, bg = medium_bg },
    BufferLineWarningDiagnostic = { fg = p.warning, bg = dark_bg },
    BufferLineWarningDiagnosticSelected = { fg = p.warning, bg = transparent and p.none or p.bg },
    BufferLineWarningDiagnosticVisible = { fg = p.warning, bg = medium_bg },
    BufferLineInfo = { fg = p.info, bg = dark_bg },
    BufferLineInfoSelected = { fg = p.info, bg = transparent and p.none or p.bg },
    BufferLineInfoVisible = { fg = p.info, bg = medium_bg },
    BufferLineInfoDiagnostic = { fg = p.info, bg = dark_bg },
    BufferLineInfoDiagnosticSelected = { fg = p.info, bg = transparent and p.none or p.bg },
    BufferLineInfoDiagnosticVisible = { fg = p.info, bg = medium_bg },
    BufferLineHint = { fg = p.hint, bg = dark_bg },
    BufferLineHintSelected = { fg = p.hint, bg = transparent and p.none or p.bg },
    BufferLineHintVisible = { fg = p.hint, bg = medium_bg },
    BufferLineHintDiagnostic = { fg = p.hint, bg = dark_bg },
    BufferLineHintDiagnosticSelected = { fg = p.hint, bg = transparent and p.none or p.bg },
    BufferLineHintDiagnosticVisible = { fg = p.hint, bg = medium_bg },
    BufferLineOffsetSeparator = { fg = p.border, bg = dark_bg },
    BufferLineTruncMarker = { fg = p.gray, bg = dark_bg },

    -- ============================================
    -- Trouble
    -- ============================================
    TroubleNormal = { fg = fg, bg = float_bg },
    TroubleNormalNC = { fg = fg, bg = float_bg },
    TroubleCount = { fg = p.purple, bg = p.bg_visual },
    TroubleError = { fg = p.error },
    TroubleWarning = { fg = p.warning },
    TroubleInformation = { fg = p.info },
    TroubleHint = { fg = p.hint },
    TroubleLocation = { fg = p.gray },
    TroubleFoldIcon = { fg = p.teal },
    TroubleIndent = { fg = p.indent_guide },
    TroubleSource = { fg = p.gray },
    TroubleText = { fg = fg },
    TroubleTextError = { fg = p.error },
    TroubleTextWarning = { fg = p.warning },
    TroubleTextInformation = { fg = p.info },
    TroubleTextHint = { fg = p.hint },

    -- ============================================
    -- nvim-notify
    -- ============================================
    NotifyERRORBorder = { fg = p.error },
    NotifyWARNBorder = { fg = p.warning },
    NotifyINFOBorder = { fg = p.info },
    NotifyDEBUGBorder = { fg = p.gray },
    NotifyTRACEBorder = { fg = p.purple },
    NotifyERRORIcon = { fg = p.error },
    NotifyWARNIcon = { fg = p.warning },
    NotifyINFOIcon = { fg = p.info },
    NotifyDEBUGIcon = { fg = p.gray },
    NotifyTRACEIcon = { fg = p.purple },
    NotifyERRORTitle = { fg = p.error },
    NotifyWARNTitle = { fg = p.warning },
    NotifyINFOTitle = { fg = p.info },
    NotifyDEBUGTitle = { fg = p.gray },
    NotifyTRACETitle = { fg = p.purple },
    NotifyERRORBody = { fg = fg },
    NotifyWARNBody = { fg = fg },
    NotifyINFOBody = { fg = fg },
    NotifyDEBUGBody = { fg = fg },
    NotifyTRACEBody = { fg = fg },

    -- ============================================
    -- Noice
    -- ============================================
    NoiceCmdline = { fg = fg },
    NoiceCmdlineIcon = { fg = p.teal },
    NoiceCmdlineIconSearch = { fg = p.orange },
    NoiceCmdlinePopup = { fg = fg, bg = float_bg },
    NoiceCmdlinePopupBorder = { fg = p.border, bg = float_bg },
    NoiceCmdlinePopupBorderSearch = { fg = p.orange, bg = float_bg },
    NoiceCmdlinePopupTitle = { fg = p.teal, bg = float_bg, bold = true },
    NoiceConfirm = { fg = fg, bg = float_bg },
    NoiceConfirmBorder = { fg = p.border, bg = float_bg },
    NoiceFormatConfirm = { fg = p.teal },
    NoiceFormatConfirmDefault = { fg = p.teal, bg = p.bg_visual },
    NoiceMini = { fg = fg, bg = medium_bg },
    NoicePopup = { fg = fg, bg = float_bg },
    NoicePopupBorder = { fg = p.border, bg = float_bg },
    NoicePopupmenu = { fg = fg, bg = float_bg },
    NoicePopupmenuBorder = { fg = p.border, bg = float_bg },
    NoicePopupmenuMatch = { fg = p.orange, bold = true },
    NoicePopupmenuSelected = { fg = p.fg_gutter, bg = p.bg_visual, bold = true },
    NoiceScrollbar = { fg = p.gray, bg = float_bg },
    NoiceScrollbarThumb = { fg = p.fg_muted },
    NoiceSplit = { fg = fg, bg = float_bg },
    NoiceSplitBorder = { fg = p.border, bg = float_bg },
    NoiceVirtualText = { fg = p.teal },

    -- ============================================
    -- Flash.nvim
    -- ============================================
    FlashBackdrop = { fg = p.gray },
    FlashMatch = { fg = p.orange, bg = transparent and p.none or util.blend(p.orange, p.bg, 0.2) },
    FlashCurrent = { fg = p.fg_gutter, bg = p.bg_visual, bold = true },
    FlashLabel = { fg = p.bg, bg = p.orange, bold = true },
    FlashPrompt = { fg = fg, bg = float_bg },
    FlashPromptIcon = { fg = p.teal },

    -- ============================================
    -- Leap.nvim
    -- ============================================
    LeapMatch = { fg = p.orange, bold = true, underline = true },
    LeapLabelPrimary = { fg = p.bg, bg = p.orange, bold = true },
    LeapLabelSecondary = { fg = p.bg, bg = p.teal, bold = true },
    LeapBackdrop = { fg = p.gray },

    -- ============================================
    -- Mini.nvim
    -- ============================================
    MiniCursorword = { bg = p.bg_visual },
    MiniCursorwordCurrent = { bg = p.bg_visual },
    MiniIndentscopeSymbol = { fg = p.indent_guide_active },
    MiniIndentscopePrefix = { nocombine = true },
    MiniJump = { fg = p.bg, bg = p.orange },
    MiniJump2dSpot = { fg = p.orange, bold = true },
    MiniJump2dSpotAhead = { fg = p.teal, bold = true },
    MiniJump2dSpotUnique = { fg = p.green, bold = true },
    MiniStarterCurrent = { bold = true },
    MiniStarterFooter = { fg = p.gray, italic = true },
    MiniStarterHeader = { fg = p.teal },
    MiniStarterInactive = { fg = p.gray },
    MiniStarterItem = { fg = fg },
    MiniStarterItemBullet = { fg = p.border },
    MiniStarterItemPrefix = { fg = p.orange },
    MiniStarterSection = { fg = p.teal, bold = true },
    MiniStarterQuery = { fg = p.orange },
    MiniStatuslineDevinfo = { fg = p.fg_muted, bg = p.bg_visual },
    MiniStatuslineFileinfo = { fg = p.fg_muted, bg = p.bg_visual },
    MiniStatuslineFilename = { fg = fg, bg = p.bg_medium },
    MiniStatuslineInactive = { fg = p.gray, bg = p.bg_medium },
    MiniStatuslineModeCommand = { fg = p.bg, bg = p.orange, bold = true },
    MiniStatuslineModeInsert = { fg = p.bg, bg = p.green, bold = true },
    MiniStatuslineModeNormal = { fg = p.bg, bg = p.teal, bold = true },
    MiniStatuslineModeOther = { fg = p.bg, bg = p.purple, bold = true },
    MiniStatuslineModeReplace = { fg = p.bg, bg = p.red, bold = true },
    MiniStatuslineModeVisual = { fg = p.bg, bg = p.olive, bold = true },
    MiniSurround = { fg = p.bg, bg = p.orange },
    MiniTablineCurrent = { fg = fg, bg = p.bg, bold = true },
    MiniTablineFill = { bg = p.bg_dark },
    MiniTablineHidden = { fg = p.gray, bg = p.bg_dark },
    MiniTablineModifiedCurrent = { fg = p.git_change, bg = p.bg, bold = true },
    MiniTablineModifiedHidden = { fg = p.git_change, bg = p.bg_dark },
    MiniTablineModifiedVisible = { fg = p.git_change, bg = p.bg_medium },
    MiniTablineTabpagesection = { fg = fg, bg = p.bg_visual },
    MiniTablineVisible = { fg = p.fg_muted, bg = p.bg_medium },
    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = p.red, bold = true },
    MiniTestPass = { fg = p.green, bold = true },
    MiniTrailspace = { bg = p.red },

    -- ============================================
    -- nvim-navic
    -- ============================================
    NavicText = { fg = fg },
    NavicSeparator = { fg = p.gray },
    NavicIconsFile = { fg = p.teal },
    NavicIconsModule = { fg = p.fg_gutter },
    NavicIconsNamespace = { fg = p.fg_gutter },
    NavicIconsPackage = { fg = p.fg_gutter },
    NavicIconsClass = { fg = p.fg_gutter },
    NavicIconsMethod = { fg = p.fg_gutter },
    NavicIconsProperty = { fg = p.fg_gutter },
    NavicIconsField = { fg = p.fg_gutter },
    NavicIconsConstructor = { fg = p.fg_gutter },
    NavicIconsEnum = { fg = p.fg_gutter },
    NavicIconsInterface = { fg = p.fg_gutter },
    NavicIconsFunction = { fg = p.fg_gutter },
    NavicIconsVariable = { fg = fg },
    NavicIconsConstant = { fg = p.red },
    NavicIconsString = { fg = p.green },
    NavicIconsNumber = { fg = p.red },
    NavicIconsBoolean = { fg = p.red },
    NavicIconsArray = { fg = p.fg_gutter },
    NavicIconsObject = { fg = p.fg_gutter },
    NavicIconsKey = { fg = p.orange },
    NavicIconsNull = { fg = p.red },
    NavicIconsEnumMember = { fg = p.red },
    NavicIconsStruct = { fg = p.fg_gutter },
    NavicIconsEvent = { fg = p.purple },
    NavicIconsOperator = { fg = fg },
    NavicIconsTypeParameter = { fg = p.fg_gutter },

    -- ============================================
    -- Dashboard / Alpha
    -- ============================================
    DashboardShortCut = { fg = p.orange },
    DashboardHeader = { fg = p.teal },
    DashboardCenter = { fg = p.fg_gutter },
    DashboardFooter = { fg = p.gray, italic = true },
    DashboardKey = { fg = p.orange },
    DashboardDesc = { fg = fg },
    DashboardIcon = { fg = p.teal },
    AlphaShortcut = { fg = p.orange },
    AlphaHeader = { fg = p.teal },
    AlphaHeaderLabel = { fg = p.orange },
    AlphaFooter = { fg = p.gray, italic = true },
    AlphaButtons = { fg = fg },

    -- ============================================
    -- Snacks.nvim
    -- ============================================
    SnacksNormal = { fg = fg, bg = float_bg },
    SnacksNormalNC = { fg = fg, bg = float_bg },
    SnacksBackdrop = { bg = p.bg_dark },
    SnacksWin = { fg = fg, bg = float_bg },
    SnacksWinBar = { fg = p.teal, bg = float_bg, bold = true },
    SnacksWinBarNC = { fg = p.gray, bg = float_bg },

    -- Snacks Dashboard
    SnacksDashboardNormal = { fg = fg, bg = transparent and p.none or p.bg },
    SnacksDashboardDesc = { fg = fg },
    SnacksDashboardFile = { fg = p.teal },
    SnacksDashboardDir = { fg = p.gray },
    SnacksDashboardFooter = { fg = p.gray, italic = true },
    SnacksDashboardHeader = { fg = p.teal },
    SnacksDashboardIcon = { fg = p.teal },
    SnacksDashboardKey = { fg = p.orange },
    SnacksDashboardSpecial = { fg = p.purple },
    SnacksDashboardTitle = { fg = p.teal, bold = true },

    -- Snacks Picker
    SnacksPicker = { fg = fg, bg = float_bg },
    SnacksPickerBorder = { fg = p.border, bg = float_bg },
    SnacksPickerTitle = { fg = p.teal, bg = float_bg, bold = true },
    SnacksPickerNormal = { fg = fg, bg = float_bg },
    SnacksPickerList = { fg = fg, bg = float_bg },
    SnacksPickerListBorder = { fg = p.border, bg = float_bg },
    SnacksPickerListTitle = { fg = p.teal, bg = float_bg, bold = true },
    SnacksPickerPreview = { fg = fg, bg = float_bg },
    SnacksPickerPreviewBorder = { fg = p.border, bg = float_bg },
    SnacksPickerPreviewTitle = { fg = p.teal, bg = float_bg, bold = true },
    SnacksPickerInput = { fg = fg, bg = medium_bg },
    SnacksPickerInputBorder = { fg = p.border, bg = medium_bg },
    SnacksPickerInputTitle = { fg = p.teal, bg = medium_bg, bold = true },
    SnacksPickerPrompt = { fg = p.orange },
    SnacksPickerSelected = { fg = p.fg_gutter, bg = p.bg_visual, bold = true },
    SnacksPickerMatch = { fg = p.orange, bold = true },
    SnacksPickerDir = { fg = p.gray },
    SnacksPickerFile = { fg = fg },
    SnacksPickerGitAdded = { fg = p.git_add },
    SnacksPickerGitDeleted = { fg = p.git_delete },
    SnacksPickerGitModified = { fg = p.git_change },
    SnacksPickerGitUntracked = { fg = p.git_add },
    SnacksPickerGitIgnored = { fg = p.gray },
    SnacksPickerRow = { fg = p.gray },
    SnacksPickerCol = { fg = p.gray },
    SnacksPickerComment = { fg = p.comment },
    SnacksPickerIdx = { fg = p.orange },
    SnacksPickerIcon = { fg = p.teal },
    SnacksPickerIconDirectory = { fg = p.teal },
    SnacksPickerTree = { fg = p.indent_guide },
    SnacksPickerToggle = { fg = p.purple },
    SnacksPickerVirtText = { fg = p.gray },
    SnacksPickerDelim = { fg = p.gray },
    SnacksPickerSpecial = { fg = p.purple },
    SnacksPickerLabel = { fg = p.orange, bold = true },
    SnacksPickerFormatString = { fg = p.green },

    -- Snacks Notifier
    SnacksNotifierInfo = { fg = p.info, bg = float_bg },
    SnacksNotifierWarn = { fg = p.warning, bg = float_bg },
    SnacksNotifierDebug = { fg = p.gray, bg = float_bg },
    SnacksNotifierError = { fg = p.error, bg = float_bg },
    SnacksNotifierTrace = { fg = p.purple, bg = float_bg },
    SnacksNotifierIconInfo = { fg = p.info, bg = float_bg },
    SnacksNotifierIconWarn = { fg = p.warning, bg = float_bg },
    SnacksNotifierIconDebug = { fg = p.gray, bg = float_bg },
    SnacksNotifierIconError = { fg = p.error, bg = float_bg },
    SnacksNotifierIconTrace = { fg = p.purple, bg = float_bg },
    SnacksNotifierTitleInfo = { fg = p.info, bg = float_bg, bold = true },
    SnacksNotifierTitleWarn = { fg = p.warning, bg = float_bg, bold = true },
    SnacksNotifierTitleDebug = { fg = p.gray, bg = float_bg, bold = true },
    SnacksNotifierTitleError = { fg = p.error, bg = float_bg, bold = true },
    SnacksNotifierTitleTrace = { fg = p.purple, bg = float_bg, bold = true },
    SnacksNotifierBorderInfo = { fg = p.info, bg = float_bg },
    SnacksNotifierBorderWarn = { fg = p.warning, bg = float_bg },
    SnacksNotifierBorderDebug = { fg = p.gray, bg = float_bg },
    SnacksNotifierBorderError = { fg = p.error, bg = float_bg },
    SnacksNotifierBorderTrace = { fg = p.purple, bg = float_bg },
    SnacksNotifierFooterInfo = { fg = p.info, bg = float_bg },
    SnacksNotifierFooterWarn = { fg = p.warning, bg = float_bg },
    SnacksNotifierFooterDebug = { fg = p.gray, bg = float_bg },
    SnacksNotifierFooterError = { fg = p.error, bg = float_bg },
    SnacksNotifierFooterTrace = { fg = p.purple, bg = float_bg },
    SnacksNotifierHistoryInfo = { fg = p.info },
    SnacksNotifierHistoryWarn = { fg = p.warning },
    SnacksNotifierHistoryDebug = { fg = p.gray },
    SnacksNotifierHistoryError = { fg = p.error },
    SnacksNotifierHistoryTrace = { fg = p.purple },

    -- Snacks Indent
    SnacksIndent = { fg = p.indent_guide, nocombine = true },
    SnacksIndentScope = { fg = p.indent_guide_active, nocombine = true },
    SnacksIndentChunk = { fg = p.indent_guide_active, nocombine = true },

    -- Snacks Input
    SnacksInputNormal = { fg = fg, bg = float_bg },
    SnacksInputBorder = { fg = p.border, bg = float_bg },
    SnacksInputTitle = { fg = p.teal, bg = float_bg, bold = true },
    SnacksInputIcon = { fg = p.teal },

    -- Snacks Rename
    SnacksRename = { fg = fg, bg = float_bg },
    SnacksRenameBorder = { fg = p.border, bg = float_bg },
    SnacksRenameTitle = { fg = p.teal, bg = float_bg, bold = true },

    -- Snacks Scroll
    SnacksScrollBar = { fg = p.gray },

    -- Snacks Zen
    SnacksZen = { bg = transparent and p.none or p.bg },

    -- ============================================
    -- Gitsigns (inline blame, etc.)
    -- ============================================
    GitSignsCurrentLineBlame = { fg = p.gray, italic = true },

    -- ============================================
    -- vim-illuminate
    -- ============================================
    IlluminatedWordText = { bg = p.bg_visual },
    IlluminatedWordRead = { bg = p.bg_visual },
    IlluminatedWordWrite = { bg = p.bg_visual },

    -- ============================================
    -- Aerial
    -- ============================================
    AerialNormal = { fg = fg, bg = float_bg },
    AerialLine = { bg = p.bg_visual },
    AerialGuide = { fg = p.indent_guide },
    AerialClassIcon = { fg = p.fg_gutter },
    AerialFunctionIcon = { fg = p.fg_gutter },
    AerialMethodIcon = { fg = p.fg_gutter },
    AerialStructIcon = { fg = p.fg_gutter },
    AerialEnumIcon = { fg = p.fg_gutter },
    AerialInterfaceIcon = { fg = p.fg_gutter },
    AerialModuleIcon = { fg = p.fg_gutter },
    AerialConstantIcon = { fg = p.red },
    AerialVariableIcon = { fg = fg },

    -- ============================================
    -- Hop
    -- ============================================
    HopNextKey = { fg = p.orange, bold = true },
    HopNextKey1 = { fg = p.teal, bold = true },
    HopNextKey2 = { fg = p.teal_light },
    HopUnmatched = { fg = p.gray },
  }
end

return M
