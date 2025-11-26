require 'config.global'
require 'config.lazy'
require 'config.autocommands'

vim.cmd.colorscheme 'tokyonight-night'

-- transparent background if needed
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])

