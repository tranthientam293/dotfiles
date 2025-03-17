return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    {
      'antosha417/nvim-lsp-file-operations',
      config = true,
    },
    {
      'folke/neodev.nvim',
      opts = {},
    },
    {
      'j-hui/fidget.nvim',
      tag = 'v1.4.0',
      opts = {
        progress = {
          display = {
            done_icon = '✓', -- Icon shown when all LSP progress tasks are complete
          },
        },
        notification = {
          window = {
            winblend = 0, -- Background color opacity in the notification window
            border = "rounded"
          },
        },
      },
    },
  },
  config = function()
    -- import lspconfig
    local lspconfig = require('lspconfig')

    -- import mason_lspconfig
    local mason_lspconfig = require('mason-lspconfig')

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = 'Show LSP references'
        vim.keymap.set('n', 'gR', ':Telescope lsp_references<CR>', opts)

        opts.desc = 'Go to declaration'
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

        opts.desc = 'Show LSP definitions'
        vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', opts)

        opts.desc = 'Show LSP implementations'
        vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>', opts)

        opts.desc = 'Show LSP type definitions'
        vim.keymap.set('n', 'gt', ':Telescope lsp_type_definitions<CR>', opts)

        opts.desc = 'See available code actions'
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

        opts.desc = 'Smart rename'
        vim.keymap.set('n', '<leader>rm', vim.lsp.buf.rename, opts)

        opts.desc = 'Show buffer diagnostic'
        vim.keymap.set('n', '<leader>D', ':Telescope diagnostics bufnr=0<CR>', opts)

        opts.desc = 'Show line diagnostics'
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)

        opts.desc = 'Go to previous diagnostic'
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

        opts.desc = 'Go to next diagnostic'
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

        opts.desc = 'Show document for what is under cursor'
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        opts.desc = 'Restart LSP'
        vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts)
      end,
    })

    -- enable autocompletion
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ['emmet_ls'] = function()
        lspconfig['emmet_ls'].setup({
          capabilities = capabilities,
          filetypes = {
            'html',
            'typescriptreact',
            'javascriptreact',
            'css',
            'sass',
            'scss',
            'less',
            'svelte',
          },
        })
      end,
      ['lua_ls'] = function()
        lspconfig['lua_ls'].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        })
      end,
    })
  end,
}
