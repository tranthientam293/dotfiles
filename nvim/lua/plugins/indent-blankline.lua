return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('ibl').setup({
      indent = { char = '▏' },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        show_exact_scope = true,
        injected_languages = true,
        include = {
          node_type = {
            lua = { 'table_constructor', 'function', 'block' },
            javascript = { 'object', 'array', 'function', 'class', 'block' },
            typescript = { 'object', 'array', 'function', 'class', 'interface', 'block' },
            tsx = { 'jsx_element', 'jsx_fragment', 'object', 'array', 'block' },
            jsx = { 'jsx_element', 'jsx_fragment', 'object', 'array', 'block' },
            vue = { 'object', 'array', 'template_element', 'script_element', 'block' },
            css = {
              'rule_set',
              'block',
              'selector_group',
              'selector',
              'property_list',
              'property_declaration',
              'at_rule',
            },
            scss = {
              'rule_set',
              'block',
              'selector_group',
              'selector',
              'property_list',
              'property_declaration',
              'mixin_declaration',
              'include_statement',
              'at_rule',
            },
          },
        },
      },
    })
  end,
}
