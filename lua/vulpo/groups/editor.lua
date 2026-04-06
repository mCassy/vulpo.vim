-- Vulpo editor highlight groups
-- Core Neovim UI elements

local M = {}

---Get editor highlight groups
---@param p VulpoPalette
---@param opts VulpoConfig
---@param fg string
---@return table<string, vim.api.keyset.highlight>
function M.get(p, opts, fg)
  local transparent = opts.transparent

  -- Float background: use none for transparent mode, otherwise bg_float
  local float_bg = transparent and p.none or p.bg_float

  return {
    -- Basic UI
    Normal = { fg = fg, bg = transparent and p.none or p.bg },
    NormalNC = { fg = fg, bg = transparent and p.none or p.bg },
    NormalFloat = { fg = fg, bg = float_bg },
    FloatBorder = { fg = p.border, bg = float_bg },
    FloatTitle = { fg = p.teal, bg = float_bg, bold = true },
    FloatFooter = { fg = p.gray, bg = float_bg },
    Terminal = { link = "Normal" },

    -- Cursor
    Cursor = { fg = p.fg_muted, reverse = true },
    lCursor = { fg = p.fg_muted, reverse = true },
    CursorIM = { fg = p.fg_muted, reverse = true },
    CursorLine = { bg = p.bg_medium },
    CursorColumn = { bg = p.bg_medium },
    TermCursor = { fg = p.fg_muted, reverse = true },
    TermCursorNC = { fg = p.gray, reverse = true },

    -- Line numbers
    LineNr = { fg = p.fg_gutter, bg = transparent and p.none or p.bg_light, bold = opts.bold.line_numbers },
    CursorLineNr = { fg = p.red, bg = transparent and p.none or p.bg_light, bold = opts.bold.line_numbers },
    LineNrAbove = { fg = p.fg_gutter, bg = transparent and p.none or p.bg_light, bold = opts.bold.line_numbers },
    LineNrBelow = { fg = p.fg_gutter, bg = transparent and p.none or p.bg_light, bold = opts.bold.line_numbers },

    -- Sign column and fold column
    SignColumn = { fg = p.fg_gutter, bg = transparent and p.none or p.bg_light },
    FoldColumn = { fg = p.red, bg = transparent and p.none or p.bg_light, bold = opts.bold.line_numbers },
    Folded = { fg = p.teal, bg = transparent and p.none or p.bg_dark, bold = true },

    -- Status line
    StatusLine = { fg = p.fg_muted, bg = transparent and p.none or p.gray_dark },
    StatusLineNC = { fg = p.fg_gutter, bg = transparent and p.none or p.bg_light, bold = true },
    WinBar = { fg = fg, bg = transparent and p.none or p.bg },
    WinBarNC = { fg = p.gray, bg = transparent and p.none or p.bg },
    WinSeparator = { fg = p.border, bg = transparent and p.none or p.bg },
    VertSplit = { fg = p.border, bg = transparent and p.none or p.bg },

    -- Tab line
    TabLine = { fg = p.fg_gutter, bg = p.gray_dark },
    TabLineFill = { fg = p.green, bg = p.bg_dark },
    TabLineSel = { fg = p.fg_gutter, bg = p.gray, bold = true },

    -- Popup menu
    Pmenu = { fg = p.orange, bg = p.gray_dark },
    PmenuSel = { fg = p.fg_gutter, bg = p.gray, bold = true },
    PmenuSbar = { fg = p.gray_dark, reverse = true },
    PmenuThumb = { fg = p.green, reverse = true },
    PmenuKind = { fg = p.teal, bg = p.gray_dark },
    PmenuKindSel = { fg = p.teal, bg = p.gray, bold = true },
    PmenuExtra = { fg = p.gray, bg = p.gray_dark },
    PmenuExtraSel = { fg = p.fg_muted, bg = p.gray },

    -- Wild menu
    WildMenu = { fg = p.orange, bold = true, reverse = true },

    -- Search and matches
    Search = { fg = p.orange, bold = true, reverse = true },
    IncSearch = { fg = p.fg_gutter, bold = true, reverse = true },
    CurSearch = { fg = p.orange, bold = true, reverse = true },
    Substitute = { fg = p.red, bold = true, reverse = true },
    MatchParen = { fg = p.orange, bold = true, reverse = true },

    -- Visual mode
    Visual = { fg = p.olive, bg = p.gray_dark },
    VisualNOS = { fg = p.olive, bg = p.gray_dark },

    -- Diff
    DiffAdd = { fg = p.green, bold = true, reverse = true },
    DiffDelete = { fg = p.brown, bg = p.brown },
    DiffChange = { fg = p.olive, reverse = true },
    DiffText = { fg = p.fg_gutter, bold = true, reverse = true },
    diffAdded = { fg = p.green, bg = p.bg_light, bold = true },
    diffRemoved = { fg = p.red, bg = p.bg_light, bold = true },
    diffChanged = { fg = p.purple, bg = p.bg_light },
    diffOldFile = { fg = p.red },
    diffNewFile = { fg = p.green },
    diffFile = { fg = p.teal },
    diffLine = { fg = p.gray },
    diffIndexLine = { fg = p.purple },

    -- Spelling
    SpellBad = { fg = p.red, bold = true, reverse = true },
    SpellCap = { fg = p.red, bold = true, reverse = true },
    SpellLocal = { fg = p.red, bold = true, reverse = true },
    SpellRare = { fg = p.red, bold = true, reverse = true },

    -- Messages
    ErrorMsg = { fg = p.red, bold = true, reverse = true },
    WarningMsg = { fg = p.fg_gutter, bold = true, reverse = true },
    ModeMsg = { fg = p.orange, bold = true },
    MoreMsg = { fg = p.orange, bold = true },
    Question = { fg = p.orange, bold = true },
    MsgArea = { fg = fg },
    MsgSeparator = { fg = p.border },

    -- Misc UI
    Title = { fg = p.teal, underline = true },
    SpecialKey = { fg = p.teal, bold = true },
    NonText = { fg = p.teal, bg = transparent and p.none or p.bg_dark, bold = true },
    EndOfBuffer = { fg = p.teal, bg = transparent and p.none or p.bg_dark },
    Conceal = { fg = p.olive, bg = transparent and p.none or p.gray_dark },
    Directory = { fg = p.teal_light, bold = true },
    QuickFixLine = { bg = transparent and p.none or p.bg_light, bold = true },
    ColorColumn = { bg = transparent and p.none or p.bg_medium },

    -- Health
    healthError = { fg = p.red },
    healthSuccess = { fg = p.green },
    healthWarning = { fg = p.warning },

    -- Neovim specific
    NvimInternalError = { fg = p.red, bg = p.red },
    RedrawDebugClear = { fg = fg, bg = p.orange },
    RedrawDebugComposed = { fg = fg, bg = p.green },
    RedrawDebugRecompose = { fg = fg, bg = p.red },

    -- Window
    WinBar = { fg = fg, bg = transparent and p.none or p.bg },
    WinBarNC = { fg = p.gray, bg = transparent and p.none or p.bg },
  }
end

return M
