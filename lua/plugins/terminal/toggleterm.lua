return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            direction = "float",
            float_opts = {
                border = "curved",
            },
        })

        vim.keymap.set("n", "<leader>gt", function()
            require("toggleterm.terminal").Terminal
                :new({
                    cmd = os.getenv("SHELL"),
                    hidden = true,
                    direction = "float",
                })
                :toggle()
        end, { desc = "Open Git terminal" })
    end,
}
