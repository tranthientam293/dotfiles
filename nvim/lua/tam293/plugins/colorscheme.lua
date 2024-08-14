return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      show_end_of_buffer = true,
      term_colors = true,
      background = {
        light = "latte",
        dark = "mocha",
      },
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.75,
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { "italic" }, -- Change the style of comments
        conditionals = {},
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
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
      floating_border = "auto",
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
