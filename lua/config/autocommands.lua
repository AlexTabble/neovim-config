vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  pattern = { '*' },
  command = 'checktime',
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- use latest treesitter
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local ft = vim.bo[args.buf].filetype

    local allowed = {
      lua = true,
      python = true,
      javascript = true,
      typescript = true,
      rust = true,
      c = true,
      cpp = true,
      qmd = true,
      json = true,
    }

    if not allowed[ft] then
      return
    end

    pcall(vim.treesitter.start, args.buf)
  end,
})
