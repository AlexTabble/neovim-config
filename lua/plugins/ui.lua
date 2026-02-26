return {

  -- telescope
  -- a nice seletion UI also to find and open files
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      local telescope = require 'telescope'
      local actions = require 'telescope.actions'
      local previewers = require 'telescope.previewers'
      local new_maker = function(filepath, bufnr, opts)
        opts = opts or {}
        filepath = vim.fn.expand(filepath)
        vim.loop.fs_stat(filepath, function(_, stat)
          if not stat then
            return
          end
          if stat.size > 100000 then
            return
          else
            previewers.buffer_previewer_maker(filepath, bufnr, opts)
          end
        end)
      end

      local telescope_config = require 'telescope.config'
      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }
      -- I don't want to search in the `docs` directory (rendered quarto output).
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!docs/*')

      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!_site/*')

      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!_reference/*')

      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!_inv/*')

      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!*_files/libs/*')

      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!.obsidian/*')

      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!.quarto/*')

      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!_freeze/*')

      telescope.setup {
        defaults = {
          buffer_previewer_maker = new_maker,
          vimgrep_arguments = vimgrep_arguments,
          file_ignore_patterns = {
            'node%_modules',
            '%_cache',
            '%.git/',
            'site%_libs',
            '%.venv/',
            '%_files/libs/',
            '%.obsidian/',
            '%.quarto/',
            '%_freeze/',
          },
          layout_strategy = 'flex',
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
          },
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<esc>'] = actions.close,
              ['<c-j>'] = actions.move_selection_next,
              ['<c-k>'] = actions.move_selection_previous,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = false,
            find_command = {
              'rg',
              '--files',
              '--hidden',
              -- '--no-ignore',
              '--glob',
              '!.git/*',
              '--glob',
              '!**/.Rpro.user/*',
              '--glob',
              '!_site/*',
              '--glob',
              '!docs/**/*.html',
              '-L',
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          },
        },
      }
      telescope.load_extension 'fzf'
    end,
  },

  { -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = { 'VimEnter' },
    lazy = true,
    config = function()
      -- Setup lualine
      require('lualine').setup {
        options = {
          theme = 'auto',
          component_separators = '',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
          lualine_b = { 'branch' },
          lualine_c = { 'diagnostics' },
          lualine_x = {},
          lualine_y = { 'encoding', 'filetype' },
          lualine_z = { 'progress' },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = { 'diagnostics' },
          lualine_c = { 'lsp_status' },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = { 'tabs' },
        },
        extensions = { 'oil' },
      }
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
