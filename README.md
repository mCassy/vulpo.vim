# vulpo.nvim

A warm, naturalistic, earth-tone colorscheme for Neovim (0.10+).

Ported to Lua from the original [vulpo.vim](https://github.com/dylnmc/vulpo.vim) by dylnmc.

![ruby example using vulpo color scheme](https://raw.githubusercontent.com/dylnmc/i/master/vulpo_scheme.png)

Flit through your forest of code as a sly and cunning fox for as long as you please, for this color scheme is designed to protect your sensitive fox eyes without compromising readability.

## Features

- Full Lua implementation for Neovim 0.10+
- Treesitter support
- LSP diagnostics and semantic tokens
- Extensive plugin support
- Terminal themes (Ghostty, Kitty, OpenCode)
- Lualine theme included
- Configurable italic/bold styles
- Transparent background option
- Wood mode (alternative foreground color)

## Requirements

- Neovim >= 0.10.0
- `termguicolors` enabled

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "your-username/vulpo.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "your-username/vulpo.nvim",
  config = function()
    require("vulpo").setup()
    vim.cmd.colorscheme("vulpo")
  end
}
```

## Usage

```lua
-- Default configuration
require("vulpo").setup()

-- Load the colorscheme
vim.cmd.colorscheme("vulpo")
```

## Configuration

```lua
require("vulpo").setup({
  -- Enable transparent background
  transparent = false,

  -- Set terminal colors (0-15)
  terminal_colors = true,

  -- Use wood brown foreground instead of light tan
  wood_mode = false,

  -- Enable italics for specific elements
  italics = {
    comments = true,
    keywords = false,
    functions = false,
    strings = false,
    variables = false,
    parameters = false,
  },

  -- Enable bold for specific elements
  bold = {
    functions = true,
    line_numbers = true,
  },

  -- Enable filetype-specific modifications (C, Vim)
  ft_mods = true,

  -- Override specific highlight groups
  overrides = {
    -- Example: make comments bright red
    -- Comment = { fg = "#ff0000" },
  },
})
```

## Plugin Support

Vulpo includes highlight groups for these plugins:

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [leap.nvim](https://github.com/ggandor/leap.nvim)
- [mini.nvim](https://github.com/echasnovski/mini.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) / [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim)
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

## Lualine

The lualine theme is automatically available when the colorscheme is loaded:

```lua
require("lualine").setup({
  options = {
    theme = "vulpo",
  },
})
```

## Extras

Terminal themes are available in the `extras/` directory:

### Ghostty

Copy `extras/ghostty/vulpo` to your Ghostty themes directory.

### Kitty

Include in your `kitty.conf`:

```
include /path/to/vulpo.nvim/extras/kitty/vulpo.conf
```

### OpenCode

Copy `extras/opencode/vulpo.json` to your OpenCode themes directory.

## Color Palette

| Color      | Hex       | Usage                  |
| ---------- | --------- | ---------------------- |
| Background | `#1c1c1c` | Main background        |
| Foreground | `#d7d7af` | Default text           |
| Wood       | `#af875f` | Alternative foreground |
| Red        | `#d75f5f` | Errors, constants      |
| Green      | `#5f875f` | Strings, success       |
| Orange     | `#d7875f` | Statements, keywords   |
| Teal       | `#5f8787` | Titles, info           |
| Olive      | `#87875f` | Visual mode            |
| Gray       | `#626262` | Comments               |
| Purple     | `#af87d7` | Git changes            |

## Credits

- Original [vulpo.vim](https://github.com/dylnmc/vulpo.vim) by [dylnmc](https://github.com/dylnmc)
- Inspired by [synthwave-85.nvim](https://github.com/mCassy/synthwave-85.nvim) architecture

## License

MIT
