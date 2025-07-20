-- Not really neogit as I'm still learning git
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

        -- Optional: keymap to open Git terminal
        vim.keymap.set("n", "<leader>g", function()
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
