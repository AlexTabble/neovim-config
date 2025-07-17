#  neovim Config
---
Motivation:
 - The Primeagen uses it 
 - It looks fun
 - VSCode started to annoy me with all the AI bloat
 - I'm on Linux now. Got to go full open source and embrace the change

### External Dependencies

| Dependency     | Function                  |
|----------------|---------------------------|
| `git`          | Version control           |
| `curl`         | Data transfer             |
| `node`         | JavaScript runtime        |
| `npm`          | Node package manager      |
| `lua`          | Scripting language        |
| `luarocks`     | Lua package manager       |
| `ripgrep`      | Fast text search          |
| `fd`           | File finder               |
| `quarto`       | Document rendering        |
| `python`       | General scripting         |
| `R`            | Statistical computing     |
Mason dependencies are not listed here. Check the config and either pip install python packages or install.packages() R packages

---
## Plugins


| Plugin Name                                                                 | Function              |
|------------------------------------------------------------------------------|------------------------|
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip)                              | Snippet engine        |
| [alpha-nvim](https://github.com/goolord/alpha-nvim)                         | Startup dashboard     |
| [better-escape.nvim](https://github.com/max397574/better-escape.nvim)      | Fast escape           |
| [blink.cmp](https://github.com/AckslD/blink.cmp)                            | Cursor blink          |
| [catppuccin](https://github.com/catppuccin/nvim)                            | Color theme           |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)                         | Buffer completions    |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)                     | LSP completions       |
| [cmp-path](https://github.com/hrsh7th/cmp-path)                             | Path completions      |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)                  | Snippet completions   |
| [conform.nvim](https://github.com/stevearc/conform.nvim)                    | Formatter manager     |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)       | Prebuilt snippets     |
| [lazy.nvim](https://github.com/folke/lazy.nvim)                             | Plugin manager        |
| [lazydev.nvim](https://github.com/folke/lazydev.nvim)                       | Lua dev tools         |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)               | Statusline UI         |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)| LSP config bridge     |
| [mason.nvim](https://github.com/williamboman/mason.nvim)                   | LSP/DAP installer     |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)            | File explorer         |
| [nui.nvim](https://github.com/MunifTanjim/nui.nvim)                         | UI components         |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs)                 | Auto pair brackets    |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                             | Autocompletion engine |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                 | LSP configuration     |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)      | Syntax highlighting   |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)               | Auto HTML tags        |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)        | File icons            |
| [otter.nvim](https://github.com/jmbuhr/otter.nvim)                          | Embedded LSP          |
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)                   | Lua utils             |
| [quarto-nvim](https://github.com/quarto-dev/quarto-nvim)                   | Quarto support        |
| [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Markdown rendering |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)         | Fuzzy finder          |
| [vim-floaterm](https://github.com/voldikss/vim-floaterm)                   | Floating terminal     |
| [which-key.nvim](https://github.com/folke/which-key.nvim)                  | Keymap hints          |

## Keymaps


| Keybinding     | Description                  | Group       |
|----------------|------------------------------|-------------|
| `<leader>;`    | —                            | Quarto      |
| `<leader>;p`   | Preview Document             | Quarto      |
| `<leader>;q`   | Close Preview                | Quarto      |
| `<leader>;u`   | Update Preview               | Quarto      |
| `<leader>d`    | —                            | Debug(Unused)      |
| `<leader>dO`   | Run to Cursor                | Debug(Unused)      |
| `<leader>db`   | Toggle Breakpoint            | Debug(Unused)      |
| `<leader>dc`   | Continue                     | Debug(Unused)      |
| `<leader>dd`   | Step Out                     | Debug(Unused)      |
| `<leader>di`   | Step Into                    | Debug(Unused)      |
| `<leader>do`   | Step Over                    | Debug(Unused)      |
| `<leader>dq`   | Terminate                    | Debug(Unused)      |
| `<leader>du`   | Toggle UI                    | Debug(Unused)      |
| `<leader>e`    | Toggle File Explorer         | —           |
| `<leader>f`    | —                            | Find        |
| `<leader>fb`   | Buffers                      | Find        |
| `<leader>ff`   | Files                        | Find        |
| `<leader>fg`   | Grep                         | Find        |
| `<leader>fh`   | Help                         | Find        |
| `<leader>r`    | —                            | Refactor    |
| `<leader>rr`   | Rename Symbol                | Refactor    |
| `<leader>t`    | —                            | Terminal    |
| `<leader>tr`   | Run Script in Floaterm       | Terminal    |
| `<leader>tt`   | Toggle Floaterm              | Terminal    |

