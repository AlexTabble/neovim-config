return {
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
}
