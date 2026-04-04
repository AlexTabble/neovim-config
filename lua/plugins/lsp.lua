return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'VimEnter' },
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {
        'mason-org/mason-lspconfig.nvim',
        opts = {
          automatic_enable = false,
          ensure_installed = {
            'lua_ls',
            'bashls',
            'ty',
            'r_language_server',
            'yamlls',
            'clangd',
            'texlab',
            'ltex',
            'rust_analyzer',
          },
        },
      },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = {
            'black',
            'stylua',
            'shfmt',
            'isort',
            'ruff',
            'tree-sitter-cli',
            'jupytext',
            'pyrefly',
          },
        },
      },
    },
    config = function()
      local util = require 'lspconfig.util'

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local function map(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          assert(client, 'LSP client not found')

          ---@diagnostic disable-next-line: inject-field
          client.server_capabilities.document_formatting = true

          map('gd', vim.lsp.buf.definition, '[g]o to [d]efinition')
          map('gD', vim.lsp.buf.type_definition, '[g]o to type [D]efinition')
          map('K', vim.lsp.buf.hover, 'Hover')
          map('<leader>lq', vim.diagnostic.setqflist, '[l]sp diagnostic [q]uickfix')
        end,
      })

      local lsp_flags = {
        allow_incremental_sync = true,
        debounce_text_changes = 150,
      }

      local capabilities
      local has_blink, blink = pcall(require, 'blink')
      if has_blink then
        capabilities = blink.get_lsp_capabilities({}, true)
      else
        capabilities = vim.lsp.protocol.make_client_capabilities()
      end

      -- set defaults for all clients
      vim.lsp.config('*', {
        capabilities = capabilities,
        flags = lsp_flags,
        root_markers = { '.git/' },
      })

      vim.lsp.config.ltex = {
        on_attach = function()
          require('ltex_extra').setup {
            -- This is where your dictionary will be stored! Replace this path with
            -- whatever you want!
            path = vim.fn.expand '~' .. '/.config/nvim/ltex',
          }
          -- ...
        end,
        settings = {
          ltex = {
            additionalRules = {
              enablePickyRules = true,
            },
            language = 'en-ZA',
          },
        },
        filetypes = { 'markdown', 'text', 'tex', 'gitcommit' },
        flags = { debounce_text_changes = 300 },
      }

      vim.lsp.config.r_language_server = {
        filetypes = { 'r', 'rmarkdown' }, -- not directly using it for quarto (as that is handled by otter and often contains more languanges than just R)
        settings = {
          r = {
            lsp = {
              rich_documentation = true,
            },
          },
        },
      }

      vim.lsp.config.yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = true,
              url = '',
            },
          },
        },
      }

      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            runtime = {
              version = 'LuaJIT',
            },
            diagnostics = {
              disable = { 'trailing-space' },
            },
            workspace = {
              checkThirdParty = false,
            },
            doc = {
              privateName = { '^_' },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      vim.lsp.config.texlab = {
        capabilities = capabilities,
        filetypes = { 'tex', 'plaintex', 'bib' },
        settings = {
          texlab = {
            build = {
              executable = 'latexmk',
              args = { '-xelatex', '-interaction=nonstopmode', '-synctex=1', '-outdir=build', '%f' },
              forwardSearchAfter = true,
            },
            forwardSearch = {
              executable = 'zathura',
              args = { '--synctex-forward', '%l:1:%f', '%p' },
            },
            auxDirectory = 'build',
            completion = { matcher = 'fuzzy' },
          },
        },
      }

      vim.lsp.config.bashls = {
        filetypes = { 'sh', 'bash' },
      }

      vim.lsp.config.ty = {
        capabilities = capabilities,
        filetypes = { 'python' },
      }

      vim.lsp.config.ruff = {
        capabilities = capabilities,
        filetypes = { 'python' },
      }

      vim.lsp.config.pyrefly = {
        capabilities = capabilities,
        filetypes = { 'python' },
      }

      vim.lsp.config.rust_analyzer = {
        capabilities = capabilities,
        filetypes = { 'rust' },
        root_markers = { '.git', 'Cargo.toml' },
      }

      if capabilities.workspace == nil then
        capabilities.workspace = {}
        capabilities.workspace.didChangeWatchedFiles = {}
      end
      capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

      vim.lsp.pyright = {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'workspace',
            },
          },
        },
        root_markers = { '.git', 'setup.py', 'setup.cfg', 'pyproject.toml', 'requirements.txt' },
      }
      vim.lsp.enable 'lua_ls'

      vim.lsp.enable 'r_language_server'

      -- vim.lsp.enable 'pyrefly'
      vim.lsp.enable 'pyright'
      vim.lsp.enable 'ty'
      -- vim.lsp.enable 'ruff'

      vim.lsp.enable 'bashls'

      vim.lsp.enable 'rust_analyzer'
    end,
  },
}
