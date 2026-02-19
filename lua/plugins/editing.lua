return {

  -- add/delete/change can be done with the keymaps
  -- ys{motion}{char}, ds{char}, and cs{target}{replacement}
  {
    'kylechui/nvim-surround',
    enabled = true,
    event = 'VeryLazy',
    opts = {},
  },

  { -- commenting with e.g. `gcc` or `gcip`
    -- respects TS, so it works in quarto documents 'numToStr/Comment.nvim',
    'numToStr/Comment.nvim',
    version = nil,
    cond = function()
      return vim.fn.has 'nvim-0.10' == 0
    end,
    branch = 'master',
    config = true,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    config = function()
      require('which-key').setup {}
      require 'config.keymap'
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    enabled = true,
    keys = {
      { '<leader>lf', '<cmd>lua require("conform").format()<cr>', desc = '[f]ormat' },
    },
    config = function()
      require('conform').setup {
        notify_on_error = false,
        -- format_on_save = {
        --   timeout_ms = 500,
        --   lsp_fallback = true,
        -- },
        formatters_by_ft = {
          lua = { 'stylua' },
          python = { 'isort', 'black' },
          quarto = { 'injected' },
          markdown = { 'injected' },
          r = { 'styler' },
        },
        formatters = {
          -- mystylua = {
          --   command = 'stylua',
          --   args = { '--indent-type', 'Spaces', '--indent-width', '2', '-' },
          -- },
        },
      }
      -- Customize the "injected" formatter
      require('conform').formatters.injected = {
        -- Set the options field
        options = {
          -- Set to true to ignore errors
          ignore_errors = false,
          -- Map of treesitter language to file extension
          -- A temporary file name with this extension will be generated during formatting
          -- because some formatters care about the filename.
          lang_to_ext = {
            bash = 'sh',
            c_sharp = 'cs',
            elixir = 'exs',
            javascript = 'js',
            julia = 'jl',
            latex = 'tex',
            markdown = 'md',
            python = 'py',
            ruby = 'rb',
            rust = 'rs',
            teal = 'tl',
            r = 'r',
            typescript = 'ts',
            tex = 'latexindent'
          },
          -- Map of treesitter language to formatters to use
          -- (defaults to the value from formatters_by_ft)
          lang_to_formatters = {},
        },
      }
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "hat0uma/csvview.nvim",
    ft = { "csv", "tsv" },
    config = function()
      require("csvview").setup({})
      vim.keymap.set("n", "<localleader>cv", "<cmd>CsvViewToggle <cr>", { desc = "Toggle [c]sv [v]iewer" })
    end,
  },

  { -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },

    --TODO: A Todo block
    --WARN: A Warning Block
    --NOTE: A Note Block
    --BUG: A bug block
    --PERF: A Test Block
  },


  { -- edit the file system as a buffer
    'stevearc/oil.nvim',
    opts = {
      keymaps = {
        ['<C-s>'] = false,
        ['<C-h>'] = false,
        ['<C-l>'] = false,
      },
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '-',         ':Oil<cr>', desc = 'oil' },
      { '<leader>e', ':Oil<cr>', desc = 'edit [f]iles' },
    },
    cmd = 'Oil',
  },

  {
    'chrishrb/gx.nvim',
    enabled = false,
    keys = { { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } } },
    cmd = { 'Browse' },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
    submodules = false, -- not needed, submodules are required only for tests
    opts = {
      handler_options = {
        -- you can select between google, bing, duckduckgo, and ecosia
        search_engine = 'duckduckgo',
      },
    },
  },
  {
    "lukas-reineke/virt-column.nvim",
    event = { "BufReadPre" },
    lazy = true,
    opts = {
      char = "󰮾",
      virtcolumn = "80",
    },
  },
}
