return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function()
    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter.configs")
    -- import autotag plugin
    local autotag = require("nvim-ts-autotag")
    -- configure treesitter
    treesitter.setup({
      highlight = { -- enable syntax highlighting
        enable = true,
      },
      -- enable indentation
      indent = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "vue",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })

    autotag.setup({
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    })
  end,
}
