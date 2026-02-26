return {
  'jalvesaq/zotcite',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim',
  },
  lazy = true,
  ft = {'tex'},
  config = function()
    require('zotcite').setup {
    }
  end,
}
