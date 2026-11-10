local api = vim.api
local ts = vim.treesitter

vim.bo.commentstring = '<!-- %s -->'

-- wrap text, but by word no character
-- indent the wrappped line
vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.showbreak = '|'

-- don't run vim ftplugin on top
vim.api.nvim_buf_set_var(0, 'did_ftplugin', true)

-- markdown vs. quarto hacks
local ns = vim.api.nvim_create_namespace 'QuartoHighlight'
api.nvim_set_hl(ns, '@markup.strikethrough', { strikethrough = false })
api.nvim_set_hl(ns, '@markup.doublestrikethrough', { strikethrough = true })
api.nvim_win_set_hl_ns(0, ns)

-- vim.api.nvim_set_hl(0, '@markup.codecell', { bg = '#000055' })
api.nvim_set_hl(0, '@markup.codecell', {
  link = 'CursorLine',
})

ts.start()
