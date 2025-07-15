-- Add this block to your plugin setup
return {
    "quarto-dev/quarto-nvim",
    ft = { "quarto", "markdown", "rmd", "qmd" },
    dependencies = { "nvim-telescope/telescope.nvim", "jmbuhr/otter.nvim" }, -- optional
    config = function()
        -- initialize the plugin
        require("quarto").setup({
            -- any quarto-specific options go here
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
    end,
}
