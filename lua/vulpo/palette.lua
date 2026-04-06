-- Vulpo color palette
-- Based on the original vulpo.vim colorscheme

---@class VulpoPalette
local M = {
  -- Backgrounds
  bg = "#1c1c1c", -- 234
  bg_dark = "#121212", -- 233
  bg_medium = "#262626", -- 235
  bg_light = "#303030", -- 236
  bg_visual = "#444444", -- 238
  bg_popup = "#262626",
  bg_float = "#262626",

  -- Foregrounds
  fg = "#d7d7af", -- 187 - light tan (default)
  fg_wood = "#af875f", -- 137 - wood variant
  fg_muted = "#c6c6c6", -- 251
  fg_dimmed = "#87afaf", -- 109
  fg_gutter = "#d7af87", -- 180

  -- Primary colors
  red = "#d75f5f", -- 167
  red_bright = "#ff5f5f", -- 203
  green = "#5f875f", -- 65
  green_bright = "#87af5f", -- 107
  orange = "#d7875f", -- 173
  orange_light = "#d7af87", -- 180
  teal = "#5f8787", -- 66
  teal_light = "#87afaf", -- 109
  brown = "#875f5f", -- 95
  olive = "#87875f", -- 101
  gray = "#626262", -- 241 (comments)
  gray_dark = "#444444", -- 238
  purple = "#af87d7", -- 140
  cyan_green = "#5faf87", -- 72

  -- Semantic
  comment = "#626262",
  error = "#d75f5f",
  warning = "#d7af87",
  info = "#5f8787",
  hint = "#5faf87",

  -- Git/Diff
  git_add = "#5f875f",
  git_change = "#87875f",
  git_delete = "#d75f5f",
  diff_add_bg = "#262626",
  diff_delete_bg = "#303030",

  -- UI
  border = "#87875f",
  cursor = "#d7875f",
  match = "#d7875f",
  indent_guide = "#444444",
  indent_guide_active = "#626262",
  link = "#5f8787",

  none = "NONE",
}

return M
