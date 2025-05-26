return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false, -- make sure we load this during startup
  priority = 1000, -- load before other plugins
  config = function()
    require("catppuccin").setup({
      -- Flavor configuration
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },

      -- Visual options
      transparent_background = true,
      show_end_of_buffer = false, -- show '~' after end of buffer
      term_colors = true, -- set terminal colors
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },

      -- Style customization
      no_italic = false, -- disable italics globally
      no_bold = false, -- disable bold globally
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },

      -- Color overrides (optional)
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },

      -- Custom highlights (optional)
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.overlay1, italic = true },
          LineNr = { fg = colors.overlay0 },
          CursorLineNr = { fg = colors.mauve, bold = true },
        }
      end,

      -- Plugin integrations
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = {
          enabled = true,
          style = "nvchad", -- or "classic"
        },
        notify = true,
        mini = false,
        mason = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        which_key = true,
        barbar = true,
        markdown = true,
        lightspeed = true,
        ts_rainbow = true,
        hop = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false,
        },
        dashboard = true,
        neogit = true,
        vim_sneak = true,
        fern = false,
        barbar = false,
        bufferline = false,
        -- See full list at: https://github.com/catppuccin/nvim#integrations
      },
    })

    -- Load the colorscheme
    vim.cmd.colorscheme("catppuccin")
  end,
}
