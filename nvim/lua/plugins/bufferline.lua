return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  config = function()
    local bufferline = require('bufferline')

    bufferline.setup({
      options = {
        style_preset = bufferline.style_preset.no_italic,
        mode = 'buffers',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
            separator = false,
          },
        },
      },
    })

    -- keymaps
    local opts = { noremap = true, silent = true }

    opts.desc = 'Pick buffer'
    vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', opts)

    opts.desc = 'Close other buffers'
    vim.keymap.set('n', '<leader>bdo', ':BufferLineCloseOthers<CR>', opts)

    opts.desc = 'Close left buffers'
    vim.keymap.set('n', '<leader>bdl', ':BufferLineCloseLeft<CR>', opts)

    opts.desc = 'Close right buffers'
    vim.keymap.set('n', '<leader>bdr', ':BufferLineCloseRight<CR>', opts)

    opts.desc = 'Move buffer to the left'
    vim.keymap.set('n', '<leader>bml', ':BufferLineMovePrev<CR>', opts)

    opts.desc = 'Move buffer to the right'
    vim.keymap.set('n', '<leader>bmr', ':BufferLineMoveNext<CR>', opts)
  end,
}
