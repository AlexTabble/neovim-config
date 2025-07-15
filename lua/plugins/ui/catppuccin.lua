return {
    {
        "catppuccin/nvim",
        name = "catppuccin", -- make sure to set the name if using `colorscheme = { "catppuccin" }`
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- or "latte", "frappe", "macchiato"
                integrations = {
                    treesitter = true,
                    lsp_trouble = true,
                    mason = true,
                    native_lsp = {
                        enabled = true,
                    },
                },
                color_overrides = {
                    mocha = {
                        base = "#000000",
                        mantle = "#000000",
                        crust = "#000000",
                    },
                },
            })

            -- set the colorscheme
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
