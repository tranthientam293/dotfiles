return {
  "akinsho/bufferline.nvim",
  version = "*",
  depedencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        indicator = {
          style = "none",
        },
        offsets = {
          {
            filetype = "NvimTree",
            text = "",
            text_align = "center",
            separator = true,
          },
        },

      }
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>bs", ":BufferLinePick<CR>", { desc = "Go to selected buffer" })
    keymap.set("n", "<leader>bn", ":BufferLineCycleNext<CR>", { desc = "Go to next buffer" })
    keymap.set("n", "<leader>bp", ":BufferLineCyclePrev<CR>", { desc = "Go to previous buffer" })
    keymap.set("n", "<leader>bdo", ":BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
    keymap.set("n", "<leader>bdl", ":BufferLineCloseLeft<CR>", { desc = "Close buffers on the left" })
    keymap.set("n", "<leader>bdr", ":BufferLineCloseRight<CR>", { desc = "Close buffers on the right" })
  end
}
