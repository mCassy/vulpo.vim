-- Vulpo treesitter highlight groups
-- Neovim Treesitter syntax highlights

local M = {}

---Get treesitter highlight groups
---@param p VulpoPalette
---@param opts VulpoConfig
---@param fg string
---@return table<string, vim.api.keyset.highlight>
function M.get(p, opts, fg)
  local config = require("vulpo.config")

  return {
    -- Identifiers
    ["@variable"] = { fg = fg, italic = config.get_italic("variables") },
    ["@variable.builtin"] = { fg = p.teal, italic = config.get_italic("variables") },
    ["@variable.parameter"] = { fg = fg, italic = config.get_italic("parameters") },
    ["@variable.parameter.builtin"] = { fg = p.teal, italic = config.get_italic("parameters") },
    ["@variable.member"] = { fg = p.fg_gutter },

    -- Constants
    ["@constant"] = { fg = p.red },
    ["@constant.builtin"] = { fg = p.red },
    ["@constant.macro"] = { fg = p.red },

    -- Modules
    ["@module"] = { fg = p.fg_gutter },
    ["@module.builtin"] = { fg = p.teal },
    ["@label"] = { fg = p.orange },

    -- Literals
    ["@string"] = { fg = p.green, italic = config.get_italic("strings") },
    ["@string.documentation"] = { fg = p.green, italic = config.get_italic("strings") },
    ["@string.regexp"] = { fg = p.cyan_green },
    ["@string.escape"] = { fg = p.cyan_green },
    ["@string.special"] = { fg = p.cyan_green },
    ["@string.special.symbol"] = { fg = p.green },
    ["@string.special.path"] = { fg = p.teal },
    ["@string.special.url"] = { fg = p.link, underline = true },

    ["@character"] = { fg = p.green },
    ["@character.special"] = { fg = p.cyan_green },

    ["@boolean"] = { fg = p.red },
    ["@number"] = { fg = p.red },
    ["@number.float"] = { fg = p.red },

    -- Types
    ["@type"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@type.builtin"] = { fg = p.teal },
    ["@type.definition"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@type.qualifier"] = { fg = p.orange },

    ["@attribute"] = { fg = p.purple },
    ["@attribute.builtin"] = { fg = p.purple },
    ["@property"] = { fg = p.fg_gutter },

    -- Functions
    ["@function"] = { fg = p.fg_gutter, bold = config.get_bold("functions"), italic = config.get_italic("functions") },
    ["@function.builtin"] = { fg = p.teal, bold = config.get_bold("functions") },
    ["@function.call"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@function.macro"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@function.method"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@function.method.call"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },

    ["@constructor"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },

    -- Keywords
    ["@keyword"] = { fg = p.orange, italic = config.get_italic("keywords") },
    ["@keyword.coroutine"] = { fg = p.orange, italic = config.get_italic("keywords") },
    ["@keyword.function"] = { fg = p.orange, italic = config.get_italic("keywords") },
    ["@keyword.operator"] = { fg = p.orange },
    ["@keyword.import"] = { fg = p.orange, italic = config.get_italic("keywords") },
    ["@keyword.type"] = { fg = p.orange },
    ["@keyword.modifier"] = { fg = p.orange },
    ["@keyword.repeat"] = { fg = p.orange, italic = config.get_italic("keywords") },
    ["@keyword.return"] = { fg = p.orange, italic = config.get_italic("keywords") },
    ["@keyword.debug"] = { fg = p.red },
    ["@keyword.exception"] = { fg = p.orange, italic = config.get_italic("keywords") },
    ["@keyword.conditional"] = { fg = p.orange, italic = config.get_italic("keywords") },
    ["@keyword.conditional.ternary"] = { fg = p.orange },
    ["@keyword.directive"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@keyword.directive.define"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },

    -- Operators and punctuation
    ["@operator"] = { fg = fg },
    ["@punctuation.delimiter"] = { fg = fg },
    ["@punctuation.bracket"] = { fg = fg },
    ["@punctuation.special"] = { fg = p.orange },

    -- Comments
    ["@comment"] = { fg = p.comment, italic = config.get_italic("comments") },
    ["@comment.documentation"] = { fg = p.comment, italic = config.get_italic("comments") },
    ["@comment.error"] = { fg = p.red, bold = true },
    ["@comment.warning"] = { fg = p.warning, bold = true },
    ["@comment.todo"] = { fg = p.green, bold = true, reverse = true },
    ["@comment.note"] = { fg = p.info, bold = true },

    -- Markup (Markdown, etc.)
    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },

    ["@markup.heading"] = { fg = p.teal, bold = true },
    ["@markup.heading.1"] = { fg = p.teal, bold = true },
    ["@markup.heading.2"] = { fg = p.teal, bold = true },
    ["@markup.heading.3"] = { fg = p.teal },
    ["@markup.heading.4"] = { fg = p.teal },
    ["@markup.heading.5"] = { fg = p.teal },
    ["@markup.heading.6"] = { fg = p.teal },

    ["@markup.quote"] = { fg = p.gray, italic = true },
    ["@markup.math"] = { fg = p.purple },
    ["@markup.environment"] = { fg = p.orange },

    ["@markup.link"] = { fg = p.link },
    ["@markup.link.label"] = { fg = p.teal },
    ["@markup.link.url"] = { fg = p.link, underline = true },

    ["@markup.raw"] = { fg = p.green },
    ["@markup.raw.block"] = { fg = p.green },

    ["@markup.list"] = { fg = p.orange },
    ["@markup.list.checked"] = { fg = p.green },
    ["@markup.list.unchecked"] = { fg = p.gray },

    -- Diff
    ["@diff.plus"] = { fg = p.git_add },
    ["@diff.minus"] = { fg = p.git_delete },
    ["@diff.delta"] = { fg = p.git_change },

    -- Tags (HTML, JSX)
    ["@tag"] = { fg = p.orange },
    ["@tag.builtin"] = { fg = p.orange },
    ["@tag.attribute"] = { fg = p.fg_gutter },
    ["@tag.delimiter"] = { fg = fg },

    -- Language-specific overrides

    -- Lua
    ["@constructor.lua"] = { fg = fg },
    ["@variable.member.lua"] = { fg = p.fg_gutter },

    -- Python
    ["@variable.builtin.python"] = { fg = p.teal, italic = config.get_italic("variables") },
    ["@attribute.python"] = { fg = p.purple },

    -- TypeScript/JavaScript
    ["@tag.tsx"] = { fg = p.orange },
    ["@tag.javascript"] = { fg = p.orange },
    ["@constructor.tsx"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@constructor.javascript"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },

    -- YAML
    ["@property.yaml"] = { fg = p.teal },
    ["@string.yaml"] = { fg = p.green },

    -- JSON
    ["@property.json"] = { fg = p.teal },
    ["@string.json"] = { fg = p.green },

    -- CSS
    ["@property.css"] = { fg = p.teal },
    ["@string.css"] = { fg = p.green },
    ["@number.css"] = { fg = p.red },
    ["@type.css"] = { fg = p.orange },

    -- PHP
    ["@type.php"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@function.php"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },
    ["@method.php"] = { fg = p.fg_gutter, bold = config.get_bold("functions") },

    -- SQL
    ["@keyword.sql"] = { fg = p.orange },
    ["@type.sql"] = { fg = p.teal },

    -- Bash/Shell
    ["@function.builtin.bash"] = { fg = p.teal },
    ["@variable.bash"] = { fg = p.fg_gutter },
  }
end

return M
