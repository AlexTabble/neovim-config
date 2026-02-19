return {
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  { -- new completion plugin
    'saghen/blink.cmp',
    enabled = true,
    dev = false,
    version = '1.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = 'cargo build --release',
    lazy = true,
    event = { 'BufEnter' },
    dependencies = {
      -- { 'rafamadriz/friendly-snippets' },
      -- { 'moyiz/blink-emoji.nvim' },
      -- { 'Kaiser-Yang/blink-cmp-git' },
      {
        'saghen/blink.compat',
        dev = false,
        opts = { impersonate_nvim_cmp = true, enable_events = true, debug = true },
      },
      {
        'jmbuhr/cmp-pandoc-references',
        dev = false,
        ft = { 'quarto', 'markdown', 'rmarkdown' },
      },

      -- { 'kdheepak/cmp-latex-symbols' },
      { 'erooke/blink-cmp-latex' },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      cmdline = {
        enabled = false,
        -- impersonate_nvim_cmp = true,
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'latex'},
        per_filetype = {

          tex = { 'lsp', 'snippets',  'path', 'buffer','latex' },
          markdown = {'lsp','snippets','path','buffer','obsidian'}
        },

        -- default = { 'lazydev', 'lsp', 'path', 'references', 'git', 'snippets', 'emoji', 'latex' },
        providers = {
          -- symbols = { name = 'symbols', module = 'blink.compat.source' },
          latex = {
            name = 'Latex',
            module = 'blink-cmp-latex',
            opts = {
              insert_command = function(ctx)
                local ft = vim.api.nvim_get_option_value('filetype', {
                  scope = 'local',
                  buf = ctx.bufnr,
                })
                if ft == 'markdown' or ft == 'quarto'  or ft == 'tex' then
                  return true
                end
                return false
              end,
            },
          },
        },
        -- obsidian = {
        --   name = "obsidian",
        --   module = "blink.compat.source",
        --
        --   opts = {
        --     cmp_name = "obsidian", -- this is the cmp source name
        --   },
        -- },
          
        lazydev = {
          name = 'LazyDev',
          modules = 'lazydev.modules.integrations.blink',
          score_offset = 100,
        },
        references = {
          name = 'pandoc_references',
          module = 'cmp-pandoc-references.blink',
          score_offset = 2,
        },
      },
      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        -- nerd_font_variant = 'mono',
      },
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
