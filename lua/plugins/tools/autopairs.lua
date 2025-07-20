return {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- load only when entering Insert mode
    config = function()
        local npairs = require("nvim-autopairs")

        npairs.setup({
            check_ts = true,                        -- enables treesitter support
            disable_filetype = { "TelescopePrompt", "vim" }, -- disable in certain filetypes
        })

        -- Completion for autopairs
        local cmp_status, cmp = pcall(require, "cmp")
        if cmp_status then
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end
    end,
}
