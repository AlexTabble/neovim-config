return {
  'MeanderingProgrammer/markdown.nvim',
  name = 'render-markdown',
  lazy = true,
  ft = 'markdown',
  opts = {
    headings = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' }, -- Nerd Font icons
    bullets = { '●', '○', '◆', '◇' },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
}
