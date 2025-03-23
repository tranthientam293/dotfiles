return {
  'neovim/nvim-lspconfig',
  dependencies = {
    {
      'folke/lazydev.nvim',
      ft = 'lua', -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        },
      },
    },
    'saghen/blink.cmp',
    {
      'j-hui/fidget.nvim',
      tag = 'v1.0.0', -- Make sure to update this to something recent!
      opts = {
        notification = {
          window = {
            windblend = 0,
          },
        },
        -- options
      },
    },
  },
  opts = {
    servers = {
      lua_ls = {
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
      },
      ts_ls = {},
      emmet_ls = {
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
      },
      html = {},
      cssls = {},
    },
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local options = { buffer = ev.buf, silent = true }

        -- Keymap
        options.desc = 'Show LSP references'
        vim.keymap.set('n', 'gR', ':Telescope lsp_references<CR>', options)

        options.desc = 'Go to declaration'
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, options)

        options.desc = 'Show LSP definitions'
        vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', {})

        options.desc = 'Show LSP implementations'
        vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>', options)

        options.desc = 'Show LSP type definitions'
        vim.keymap.set('n', 'gt', ':Telescope lsp_type_definitions<CR>', options)

        options.desc = 'Show available code action'
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, options)

        options.desc = 'Smart rename'
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, options)

        options.desc = 'Show buffer diagnostics'
        vim.keymap.set('n', '<leader>D', ':Telescope diagnostics bufnr=0<CR>', options)

        options.desc = 'Show line diagnostics'
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, options)

        options.desc = 'Go to previous diagnostic'
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, options)

        options.desc = 'Go to next diagnostic'
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, options)

        options.desc = 'Show document'
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, options)

        options.desc = 'Restart LSP'
        vim.keymap.set('n', '<leader>rs', ':LspRestart<CR>', options)
      end,
    })

    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
