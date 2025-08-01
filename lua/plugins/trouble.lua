return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
    keys = {
        {
            "<leader>Dx",
            function()
                require("trouble").toggle()
            end,
            desc = "[D]iagnostics: Toggle diagnostics",
        },
        {
            "<leader>Dd",
            function()
                require("trouble").toggle("document_diagnostics")
            end,
            desc = "[D]iagnostics: Toggle [d]ocument diagnostics",
        },
        {
            "<leader>Dw",
            function()
                require("trouble").toggle("workspace_diagnostics")
            end,
            desc = "[D]iagnostics: Toggle [w]orkspace diagnostics",
        },
        {
            "<leader>Dq",
            function()
                require("trouble").toggle("quickfix")
            end,
            desc = "[D]iagnostics: Toggle diagnostic [q]uickfix list",
        },
    },
}
