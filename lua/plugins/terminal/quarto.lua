return {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "markdown", "rmd", "qmd" },
    dependencies = { "nvim-telescope/telescope.nvim", "jmbuhr/otter.nvim" }, -- optional
    config = function()
        -- initialize the plugin
        require("quarto").setup({
            codeRunner = {
                enabled = true,
                default_method = "iron",
            },
            languages = { "r,", "python", "bash", "html" },
        })

        -- Render document
        vim.keymap.set(
            "n",
            "<leader>;p",
            ":lua require'quarto'.quartoPreview()<cr>",
            { noremap = true, silent = true, desc = "Quarto: Render document" }
        )

        -- Close preview
        vim.keymap.set(
            "n",
            "<leader>;q",
            ":lua require'quarto'.quartoClosePreview()<cr>",
            { noremap = true, silent = true, desc = "Quarto: Close preview" }
        )

        -- Update preview (starts if not already running)
        vim.keymap.set(
            "n",
            "<leader>;u",
            ":lua require'quarto'.quartoUpdatePreview()<cr>",
            { noremap = true, silent = true, desc = "Quarto: Update/Start preview" }
        )

        vim.keymap.set("n", "<leader>;r", require("quarto.runner").run_cell, { desc = "Run cell", silent = true })
    end,
}
