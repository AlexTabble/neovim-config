return {
    {
        "voldikss/vim-floaterm",
        init = function()
            vim.g.floaterm_keymap_new = "<leader>tn"
            vim.g.floaterm_keymap_prev = "<leader>tl"
            vim.g.floaterm_keymap_next = "<leader>t"
            vim.g.floaterm_keymap_toggle = "<leader>tt"
        end,
        config = function()
            -- Python runner
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "python",
                callback = function()
                    vim.api.nvim_set_keymap(
                        "n",
                        "<leader>tr",
                        ":w<CR>:FloatermNew --autoclose=0 python3 %<CR>",
                        { noremap = true, silent = true }
                    )
                    vim.api.nvim_set_keymap(
                        "i",
                        "<leader>tr",
                        "<ESC>:w<CR>:FloatermNew --autoclose=0 python3 %<CR>",
                        { noremap = true, silent = true }
                    )
                end,
            })

            -- R runner
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "r",
                callback = function()
                    vim.api.nvim_set_keymap(
                        "n",
                        "<leader>tr",
                        ":w<CR>:FloatermNew --autoclose=0 Rscript %<CR>",
                        { noremap = true, silent = true }
                    )
                    vim.api.nvim_set_keymap(
                        "i",
                        "<leader>tr",
                        "<ESC>:w<CR>:FloatermNew --autoclose=0 Rscript %<CR>",
                        { noremap = true, silent = true }
                    )
                end,
            })
        end,
    },
}
