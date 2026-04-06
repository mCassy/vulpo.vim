-- Vulpo utility functions for color manipulation

local M = {}

---Convert hex color to RGB
---@param hex string Hex color (e.g., "#d7d7af")
---@return number, number, number
function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

---Convert RGB to hex color
---@param r number Red (0-255)
---@param g number Green (0-255)
---@param b number Blue (0-255)
---@return string
function M.rgb_to_hex(r, g, b)
  return string.format("#%02x%02x%02x", math.floor(r), math.floor(g), math.floor(b))
end

---Blend two colors together
---@param fg string Foreground hex color
---@param bg string Background hex color
---@param alpha number Blend factor (0-1, 0 = bg, 1 = fg)
---@return string
function M.blend(fg, bg, alpha)
  local fg_r, fg_g, fg_b = M.hex_to_rgb(fg)
  local bg_r, bg_g, bg_b = M.hex_to_rgb(bg)

  local r = fg_r * alpha + bg_r * (1 - alpha)
  local g = fg_g * alpha + bg_g * (1 - alpha)
  local b = fg_b * alpha + bg_b * (1 - alpha)

  return M.rgb_to_hex(r, g, b)
end

---Darken a color
---@param hex string Hex color
---@param amount number Amount to darken (0-1)
---@return string
function M.darken(hex, amount)
  return M.blend(hex, "#000000", 1 - amount)
end

---Lighten a color
---@param hex string Hex color
---@param amount number Amount to lighten (0-1)
---@return string
function M.lighten(hex, amount)
  return M.blend(hex, "#ffffff", 1 - amount)
end

---Clamp a value between min and max
---@param value number
---@param min number
---@param max number
---@return number
function M.clamp(value, min, max)
  return math.max(min, math.min(max, value))
end

return M
