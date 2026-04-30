return {
  { 'nvim-lua/plenary.nvim' },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('which-key').setup {}
      require 'config.keymap'
    end,
  },
  {
    'lukas-reineke/virt-column.nvim',
    event = { 'BufReadPre' },
    lazy = true,
    opts = {
      char = '󰮾',
      virtcolumn = '80',
    },
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
