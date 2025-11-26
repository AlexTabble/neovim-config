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
    -- version = '*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    build = 'cargo build --release',
    lazy = true,
    event = {'BufEnter'},
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
      -- { 'erooke/blink-cmp-latex' },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      cmdline = {
        enabled = false,
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
        -- default = { 'lazydev', 'lsp', 'path', 'references', 'git', 'snippets', 'emoji', 'latex' },
        -- providers = {
        --   git = {
        --     module = 'blink-cmp-git',
        --     name = 'Git',
        --     opts = {},
        --     enabled = function()
        --       return vim.tbl_contains({ 'octo', 'gitcommit', 'git' }, vim.bo.filetype)
        --     end,
        --   },
        --   symbols = { name = 'symbols', module = 'blink.compat.source' },
        --
        -- },
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
