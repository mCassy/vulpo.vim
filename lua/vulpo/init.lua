-- Vulpo colorscheme for Neovim
-- Ported from https://github.com/dylnmc/vulpo.vim

local M = {}

---Setup the colorscheme with optional configuration
---@param opts? VulpoConfig
function M.setup(opts)
  require("vulpo.config").setup(opts)
end

---Load the colorscheme
function M.load()
  -- Clear existing highlights
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Set colorscheme properties
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "vulpo"

  local config = require("vulpo.config")
  local palette = require("vulpo.palette")

  -- Determine foreground based on wood_mode
  local fg = config.options.wood_mode and palette.fg_wood or palette.fg

  -- Load highlight groups
  local groups = {}

  -- Merge all group modules
  local editor = require("vulpo.groups.editor").get(palette, config.options, fg)
  local syntax = require("vulpo.groups.syntax").get(palette, config.options, fg)
  local treesitter = require("vulpo.groups.treesitter").get(palette, config.options, fg)
  local lsp = require("vulpo.groups.lsp").get(palette, config.options, fg)
  local plugins = require("vulpo.groups.plugins").get(palette, config.options, fg)

  for k, v in pairs(editor) do
    groups[k] = v
  end
  for k, v in pairs(syntax) do
    groups[k] = v
  end
  for k, v in pairs(treesitter) do
    groups[k] = v
  end
  for k, v in pairs(lsp) do
    groups[k] = v
  end
  for k, v in pairs(plugins) do
    groups[k] = v
  end

  -- Apply user overrides
  for k, v in pairs(config.options.overrides) do
    groups[k] = v
  end

  -- Apply highlights
  for group, hl in pairs(groups) do
    vim.api.nvim_set_hl(0, group, hl)
  end

  -- Set terminal colors
  if config.options.terminal_colors then
    M.set_terminal_colors(palette)
  end
end

---Set terminal colors (0-15)
---@param p VulpoPalette
function M.set_terminal_colors(p)
  vim.g.terminal_color_0 = p.gray_dark -- black
  vim.g.terminal_color_1 = p.red -- red
  vim.g.terminal_color_2 = p.green -- green
  vim.g.terminal_color_3 = p.orange -- yellow
  vim.g.terminal_color_4 = p.teal -- blue
  vim.g.terminal_color_5 = p.brown -- magenta
  vim.g.terminal_color_6 = p.olive -- cyan
  vim.g.terminal_color_7 = p.fg -- white
  vim.g.terminal_color_8 = p.gray -- bright black
  vim.g.terminal_color_9 = p.red_bright -- bright red
  vim.g.terminal_color_10 = p.green_bright -- bright green
  vim.g.terminal_color_11 = p.orange_light -- bright yellow
  vim.g.terminal_color_12 = p.teal_light -- bright blue
  vim.g.terminal_color_13 = p.purple -- bright magenta
  vim.g.terminal_color_14 = p.cyan_green -- bright cyan
  vim.g.terminal_color_15 = p.fg_muted -- bright white
end

return M
