return {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ops = {
        on_attach = function(bufnr)
            vim.schedule(function()
                vim.schedule("MarkdownRender")
            end)
        end,
    },
}
