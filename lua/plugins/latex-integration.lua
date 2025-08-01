return {
    {
        "lervag/vimtex",
        ft = { "tex", "markdown" },
        init = function()
            vim.g.vimtex_view_method = "zathura"
            vim.g.vimtex_syntax_conceal_disable = 1
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_compiler_latexmk = {
                continuous = 1,
            }
        end,
    },
    {
        "vim-latex/vim-latex",
        ft = { "markdown" },
        init = function()
            vim.g.tex_flavor = "latex"
            vim.g.imap_leader = ";"
            vim.g.tex_indent_items = 0
            vim.g.latex_suite_menu = 0
        end,
    },

    {
        "jbyuki/nabla.nvim",
        ft = { "markdown", "tex" },
        keys = {
            {
                "<leader>pe",
                function()
                    require("nabla").popup()
                end,
                desc = "Preview Math (popup)",
            },
            {
                "<leader>pv",
                function()
                    require("nabla").enable_virt()
                end,
                desc = "Enable inline math",
            },
        },
    },
}
