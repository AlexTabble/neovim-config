local M = {}

function M.setup()
    -- Capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig").util.default_config.capabilities = capabilities

    -- Keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
            local opts = { buffer = event.buf }

            local keymap = vim.keymap.set
            keymap("n", "K", vim.lsp.buf.hover, opts)
            keymap("n", "gd", vim.lsp.buf.definition, opts)
            keymap("n", "gD", vim.lsp.buf.declaration, opts)
            keymap("n", "gi", vim.lsp.buf.implementation, opts)
            keymap("n", "go", vim.lsp.buf.type_definition, opts)
            keymap("n", "gr", vim.lsp.buf.references, opts)
            keymap("n", "gl", vim.diagnostic.open_float, opts)
            keymap("n", "<leader>rr", vim.lsp.buf.rename, opts)
        end,
    })
end

function M.setup_mason_and_cmp()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pylsp", "r_language_server" },
        handlers = {
            function(server)
                require("lspconfig")[server].setup({})
            end,
            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup({
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = { library = { vim.env.VIMRUNTIME } },
                        },
                    },
                })
            end,
        },
    })

    -- Completion
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<CR>"] = function(fallback)
                if cmp.visible() then
                    cmp.abort() -- or cmp.close()
                else
                    fallback()
                end
            end,
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<C-y>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
        }),
        sources = {
            { name = "nvim_lsp" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
            { name = "otter" },
            { name = "snippets" },
            providers = {
                lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
            },
        },
        formatting = {
            fields = { "abbr", "menu", "kind" },
            format = function(entry, item)
                item.menu = "[" .. entry.source.name .. "]"
                return item
            end,
        },
    })
end

return M
