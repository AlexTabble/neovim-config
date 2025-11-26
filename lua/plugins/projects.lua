return {
  'coffebar/neovim-project',
  lazy = true,
  cmd = { 'NeovimProjectDiscover', 'NeovimProjectLoad' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope.nvim', cmd = 'Telescope' },
    { 'Shatur/neovim-session-manager', cmd = 'SessionManager' },
  },
  opts = {
    projects = {
      '~/Projects/*',
      '~/.config/nvim',
      '~/Documents/ObVault',
      '~/.config/jmbuhr',
    },
    picker = { type = 'telescope' },
    last_session_on_startup = false,
  },
  init= function()
    vim.opt.sessionoptions:append 'globals'

    local map = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { desc = desc })
    end

    map('<leader>nn', function()
      vim.cmd 'NeovimProjectLoad ~/.config/nvim'
    end, 'Open nvim config')

    map('<leader>no', function()
      vim.cmd 'NeovimProjectLoad ~/Documents/ObVault'
    end, 'Open Obsidian vault')

    map('<leader>np', '<cmd>NeovimProjectDiscover alphabetical_path<CR>', 'Pick Project')

    map('<leader>nh', function()
      vim.cmd 'NeovimProjectLoad ~/'
      vim.cmd 'Alpha'
    end, 'Go Home')
    map('<leader>nc', function()
      vim.cmd 'NeovimProjectLoad ~/.config'
    end)
  end,
}
