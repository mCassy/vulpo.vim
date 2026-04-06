-- Vulpo lualine theme
-- Warm earth-tone colorscheme for lualine

local p = require("vulpo.palette")

local vulpo = {}

vulpo.normal = {
  a = { fg = p.bg, bg = p.teal, gui = "bold" },
  b = { fg = p.fg_muted, bg = p.bg_visual },
  c = { fg = p.fg, bg = p.bg_medium },
}

vulpo.insert = {
  a = { fg = p.bg, bg = p.green, gui = "bold" },
  b = { fg = p.fg_muted, bg = p.bg_visual },
  c = { fg = p.fg, bg = p.bg_medium },
}

vulpo.visual = {
  a = { fg = p.bg, bg = p.olive, gui = "bold" },
  b = { fg = p.fg_muted, bg = p.bg_visual },
  c = { fg = p.fg, bg = p.bg_medium },
}

vulpo.replace = {
  a = { fg = p.bg, bg = p.red, gui = "bold" },
  b = { fg = p.fg_muted, bg = p.bg_visual },
  c = { fg = p.fg, bg = p.bg_medium },
}

vulpo.command = {
  a = { fg = p.bg, bg = p.orange, gui = "bold" },
  b = { fg = p.fg_muted, bg = p.bg_visual },
  c = { fg = p.fg, bg = p.bg_medium },
}

vulpo.terminal = {
  a = { fg = p.bg, bg = p.green_bright, gui = "bold" },
  b = { fg = p.fg_muted, bg = p.bg_visual },
  c = { fg = p.fg, bg = p.bg_medium },
}

vulpo.inactive = {
  a = { fg = p.gray, bg = p.bg_dark },
  b = { fg = p.gray, bg = p.bg_dark },
  c = { fg = p.gray, bg = p.bg_dark },
}

return vulpo
