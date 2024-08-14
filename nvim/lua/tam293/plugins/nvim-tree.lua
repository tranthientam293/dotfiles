return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- turn off default file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
        number = true,
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {},
          },
        },
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_store" },
      },
      git = {
        ignore = false,
      },
    })
    -- Define the highlight group for the focused NvimTreeStatusLine
    vim.api.nvim_set_hl(0, "NvimTreeStatusLine", { bg = "NONE", fg = "#abb2bf" })

    -- Define the highlight group for the unfocused NvimTreeStatusLine
    vim.api.nvim_set_hl(0, "NvimTreeStatusLineNC", { bg = "NONE", fg = "#45475a" })

    -- set keymaps
    local keymap = vim
        .keymap                                                                                                         -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })                         -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })                     -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })                       -- refresh file explorer
  end
}
