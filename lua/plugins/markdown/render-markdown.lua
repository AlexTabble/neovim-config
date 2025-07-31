return {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    ft = "markdown",
    opts = {
        headings = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " }, -- Nerd Font icons
        bullets = { "●", "○", "◆", "◇" },
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
}
