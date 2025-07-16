return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        plugins = {
            marks = true,
            registers = true,
            spelling = {
                enabled = true,
                suggestions = 20,
            },
        },
        key_labels = {
            ["<leader>"] = "SPC",
            ["<cr>"] = "RET",
            ["<tab>"] = "TAB",
        },
        window = {
            border = "single",
        },
        layout = {
            align = "center",
        },
        ignore_missing = false,
    },
    config = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>;",  group = "Quarto" },
            { "<leader>;p", desc = "Preview Document" },
            { "<leader>;q", desc = "Close Preview" },
            { "<leader>;u", desc = "Update Preview" },
            { "<leader>d",  group = "Unused" },
            { "<leader>dO", desc = "Run to Cursor" },
            { "<leader>db", desc = "Toggle Breakpoint" },
            { "<leader>dc", desc = "Continue" },
            { "<leader>dd", desc = "Step Out" },
            { "<leader>di", desc = "Step Into" },
            { "<leader>do", desc = "Step Over" },
            { "<leader>dq", desc = "Terminate" },
            { "<leader>du", desc = "Toggle UI" },
            { "<leader>e",  desc = "Toggle File Explorer" },
            { "<leader>f",  group = "Find" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>",    desc = "Buffers" },
            { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<CR>",  desc = "Grep" },
            { "<leader>fh", "<cmd>Telescope help_tags<CR>",  desc = "Help" },
            { "<leader>r",  group = "Refactor" },
            { "<leader>rr", desc = "Rename Symbol" },
            { "<leader>t",  group = "Terminal" },
            { "<leader>tr", desc = "Run Script in Floaterm" },
            { "<leader>tt", desc = "Toggle Floaterm" },
        })
    end,
}
