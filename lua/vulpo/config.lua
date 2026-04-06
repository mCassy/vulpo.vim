-- Vulpo configuration module

---@class VulpoItalics
---@field comments boolean
---@field keywords boolean
---@field functions boolean
---@field strings boolean
---@field variables boolean
---@field parameters boolean

---@class VulpoBold
---@field functions boolean
---@field line_numbers boolean

---@class VulpoConfig
---@field transparent boolean Enable transparent background
---@field terminal_colors boolean Set terminal colors (0-15)
---@field wood_mode boolean Use wood brown foreground instead of light tan
---@field italics boolean|VulpoItalics Enable italics
---@field bold VulpoBold Enable bold for certain elements
---@field ft_mods boolean Enable filetype-specific modifications
---@field overrides table<string, vim.api.keyset.highlight> Highlight group overrides

local M = {}

---@type VulpoConfig
M.defaults = {
  transparent = false,
  terminal_colors = true,
  wood_mode = false,
  italics = {
    comments = true,
    keywords = false,
    functions = false,
    strings = false,
    variables = false,
    parameters = false,
  },
  bold = {
    functions = true,
    line_numbers = true,
  },
  ft_mods = true,
  overrides = {},
}

---@type VulpoConfig
M.options = {}

---Deep copy a table
---@param tbl table
---@return table
local function deep_copy(tbl)
  local copy = {}
  for k, v in pairs(tbl) do
    if type(v) == "table" then
      copy[k] = deep_copy(v)
    else
      copy[k] = v
    end
  end
  return copy
end

---Deep merge two tables
---@param t1 table
---@param t2 table
---@return table
local function deep_merge(t1, t2)
  local result = deep_copy(t1)
  for k, v in pairs(t2) do
    if type(v) == "table" and type(result[k]) == "table" then
      result[k] = deep_merge(result[k], v)
    else
      result[k] = v
    end
  end
  return result
end

---Setup configuration
---@param opts? VulpoConfig
function M.setup(opts)
  M.options = deep_merge(M.defaults, opts or {})
end

---Get italic style for a category
---@param category string
---@return boolean
function M.get_italic(category)
  local italics = M.options.italics
  if type(italics) == "boolean" then
    return italics
  end
  return italics[category] or false
end

---Get bold style for a category
---@param category string
---@return boolean
function M.get_bold(category)
  return M.options.bold[category] or false
end

-- Initialize with defaults
M.setup()

return M
