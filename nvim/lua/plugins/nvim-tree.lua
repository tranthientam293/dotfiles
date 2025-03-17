return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local nvimtree = require('nvim-tree')

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
        custom = { '.DS_store' },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap
    keymap.set('n', '<leader>ee', ':NvimTreeToggle<CR>', { desc = 'Toggle file explorer', silent = true })
    keymap.set('n', '<leader>ef', ':NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file', silent = true })
    keymap.set('n', '<leader>ec', ':NvimTreeCollapse<CR>', { desc = 'Collapse file explorer', silent = true })
    keymap.set('n', '<leader>er', ':NvimTreeRefresh<CR>', { desc = 'Refresh file explorer', silent = true })
  end,
}
