return {
  { -- highlight markdown headings and code blocks etc.
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = true,
    ft = { 'quarto', 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      render_modes = { 'n', 'c', 't' },
      completions = {
        lsp = { enabled = false },
      },
      link = {
        enabled = false,
        footnote = {
          enabled = false,
        },
      },
      heading = {
        enabled = false,
      },
      quote = {
        enabled = false,
      },
      paragraph = {
        enabled = false,
      },
      code = {
        enabled = true,
        style = 'full',
        border = 'thin',
        sign = false,
        render_modes = { 'i', 'v', 'V' },
      },
      signs = {
        enabled = false,
      },
    },
    -- {
    --   '3rd/image.nvim',
    --   config = function()
    --     require('image').setup {
    --       backend = 'kitty',
    --     }
    --   end,
    -- },
  },
}
