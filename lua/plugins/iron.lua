return {
  {
    'Vigemus/iron.nvim',
    lazy = true,
    cmd = { 'IronRepl' },
    keys = { '<localleader>tr' },
    config = function()
      local iron = require 'iron.core'
      local view = require 'iron.view'
      local common = require 'iron.fts.common'

      local bracketed_paste_quarto = function(lines, extras)
        lines = common.bracketed_paste_python(lines, extras)
        if lines[1] and lines[1]:match '^```%b{}' then
          table.remove(lines, 1)
        end
        return lines
      end

      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            python = {
              -- command = { 'ipython', '--no-autoindent' },
              command = {"uv", "run", "ipython", "--no-autoindent"},
              format = common.bracketed_paste_python,
            },
            r = {
              command = { 'R' },
            },
            quarto = {
              command = { 'ipython', '--no-autoindent' },
              -- command = { 'R' },
              block_dividers = {
                '```{python}',
                '```{r}',
                '```',
              },
              format = bracketed_paste_quarto,
            },
            markdown = {
              command = { 'ipython', '--no-autoindent' },
              block_dividers = {
                '```python',
                '```r',
                '```',
              },
              send_code_block = common.markdown,
            },
          },
          repl_open_cmd = view.split.vertical.botright '40%',
        },

        keymaps = {
          toggle_repl = '<leader>tr',
          restart_repl = '<leader>tR',
          visual_send = '<leader>tc',
          send_file = '<leader>tf',
          send_line = '<leader>tl',
          send_paragraph = '<leader>tp',
          send_until_cursor = '<leader>tu',
          cr = '<leader>t<cr>',
          interrupt = '<leader>t<space>',
          exit = '<leader>tq',
          clear = '<leader>tcl',
          send_code_block = '<leader>tb',
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true,
      }
    end,
  },
}
