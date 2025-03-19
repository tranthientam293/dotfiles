return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescriptreact = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        python = { 'isort', 'black' },
      },
      default_format_opts = {
        lsp_format = 'fallback',
      },
      -- enable below config if you want format on save
      -- format_on_save = {
      --   lsp_format = "fallback",
      --   async = false,
      --   timeout_ms = 500,
      -- },
    })

    vim.keymap.set({ 'n', 'v' }, '<leader>mf', function()
      conform.format({
        lsp_format = 'fallback',
        async = false,
        timeout_ms = 500,
      })
    end, { desc = 'Trigger format' })
  end,
}
