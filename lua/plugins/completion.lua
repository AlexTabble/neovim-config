return {

  {
    'saghen/blink.cmp',
    enabled = true,
    dev = false,
    version = '1.*',
    build = 'cargo build --release',

    lazy = true,
    event = { 'BufEnter' },

    dependencies = {
      {
        'saghen/blink.compat',
        dev = false,
        opts = { enable_events = true, debug = true },
      },
      {
        'jmbuhr/cmp-pandoc-references',
        dev = false,
        ft = { 'quarto', 'markdown', 'rmarkdown' },
        event = 'InsertEnter',
      },
      {
        'erooke/blink-cmp-latex',
        ft = { 'tex' },
        event = 'InsertEnter',
      },
    },

    opts = {
      cmdline = {
        enabled = false,
        -- impersonate_nvim_cmp = true,
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },

        per_filetype = {
          tex = { 'lsp', 'snippets', 'path', 'buffer', 'latex' },
          markdown = { 'lsp', 'snippets', 'path', 'buffer' },
          quarto = { 'lsp', 'snippets', 'path', 'buffer', 'latex' },
        },

        providers = {
          latex = {
            name = 'Latex',
            module = 'blink-cmp-latex',
            opts = {
              insert_command = function(ctx)
                local ft = vim.bo[ctx.bufnr].filetype
                return ft == 'tex'
              end,
            },
          },

          references = {
            name = 'pandoc_references',
            module = 'cmp-pandoc-references.blink',
            score_offset = 2,
          },
        },
      },

      -- appearance = {
      --   use_nvim_cmp_as_default = true,
      -- },

      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 100,
          treesitter_highlighting = true,
        },
        menu = {
          auto_show = true,
        },
      },

      signature = { enabled = true },
    },
  },
}
