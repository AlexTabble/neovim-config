local builtin = require 'telescope.builtin'
local harpoon = require 'harpoon'

-- Normal Keymaps --
-- Better functionality for general keymaps --
local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

--Save
map('n', '<C-s>', '<CMD>:w<CR>')
map('i', '<C-s>', '<esc>:w<cr><esc>')

-- Quit
map('n', '<leader>x', '<CMD>q<CR>')

-- New Windows
map('n', '|', '<CMD>vsplit<CR>')
map('n', '-', '<CMD>split<CR>') -- I basically never use this keymap

-- Window Navigation
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')

-- Better scrolling
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- File Navigation
vim.keymap.set('n', '<leader>nc', function()
  -- vim.cmd("edit ~/.config")
end, { desc = 'Edit .config' })

map('n', '<leader>e', '<CMD>:Oil<CR>')

-- Resize Windows
map('n', '<C-Left>', '<C-w><')
map('n', '<C-Right>', '<C-w>>')
map('n', '<C-Up>', '<C-w>+')
map('n', '<C-Down>', '<C-w>-')

-- Telescope Keymaps --
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, { desc = 'Telescope fuzzy find' })
vim.keymap.set('n', '<leader>fp', '<cmd>Telescope builtin<CR>', { desc = 'Telescope pickers' })
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope git_commits<CR>', { desc = 'Telescope Git Commits' })

vim.keymap.set('n', '<leader>ob', '<cmd>ObsidianBacklinks <CR>', { desc = 'Obsidian Backlinks' })


-- Harpoon Keymaps --
harpoon:setup()

vim.keymap.set('n', '<leader>ma', function()
  harpoon:list():add()
end, { desc = 'Add mark' })
vim.keymap.set('n', '<leader>md', function()
  harpoon:list():remove()
end, { desc = 'Remove mark' })

vim.keymap.set('n', '<leader>mo', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Open mark List' })

vim.keymap.set('n', '<leader>u', function()
  harpoon:list():select(1)
end, { desc = 'Select Harpoon 1' })
vim.keymap.set('n', '<leader>i', function()
  harpoon:list():select(2)
end, { desc = 'Select Harpoon 2' })
vim.keymap.set('n', '<leader>;', function()
  harpoon:list():select(3)
end, { desc = 'Select Harpoon 3' })
vim.keymap.set('n', "<leader>'", function()
  harpoon:list():select(4)
end, { desc = 'Select Harpoon 4' })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>mp', function()
  harpoon:list():prev()
end, { desc = 'Previous Mark' })
vim.keymap.set('n', '<leader>mf', function()
  harpoon:list():next()
end, { desc = 'Next Mark' })

-- Autocommands --
-- reload config file on change
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = vim.env.MYVIMRC or vim.fn.expand '~/.config/nvim/init.lua',
  callback = function()
    vim.cmd 'silent! source %'
    vim.notify('Nvim config reloaded!', vim.log.levels.INFO)
  end,
})

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 100,
      on_visual = true,
    }
  end,
})

-- Show All Keymaps
vim.keymap.set('n', '<leader>?', function()
  require('which-key').show { global = true }
end, { desc = 'Show All' })

vim.api.nvim_create_user_command('Activate', function()
  local cwd = vim.fn.getcwd()
  local venvs = { '.venv', 'venv', 'env' }

  for _, name in ipairs(venvs) do
    local venv_path = cwd .. '/' .. name
    if vim.fn.isdirectory(venv_path) == 1 then
      vim.env.VIRTUAL_ENV = venv_path
      vim.env.PATH = venv_path .. '/bin:' .. vim.env.PATH
      vim.g.python3_host_prog = venv_path .. '/bin/python'
      print('🐍 Activated virtualenv: ' .. venv_path)
      return
    end
  end
  print('⚠️ No venv found in ' .. cwd)
end, {})

vim.api.nvim_create_user_command('Deactivate', function()
  if vim.env.VIRTUAL_ENV then
    print('🐍 Deactivated venv: ' .. vim.env.VIRTUAL_ENV)
  else
    print '⚠️ No active venv.'
    return
  end

  -- Remove the venv's bin path from PATH
  local venv_bin = vim.env.VIRTUAL_ENV .. '/bin:'
  vim.env.PATH = vim.env.PATH:gsub(venv_bin, '')

  -- Unset the environment variables
  vim.env.VIRTUAL_ENV = nil
  vim.g.python3_host_prog = nil

  print '✅ Virtual environment deactivated.'
end, {})
