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
            { "<leader>;",        group = "Quarto" },
            { "<leader>;p",       desc = "Preview Document" },
            { "<leader>;q",       desc = "Close Preview" },
            { "<leader>;u",       desc = "Update Preview" },

            { "<leader>d",        group = "DAP(Unused)" },
            { "<leader>dO",       desc = "Run to Cursor" },
            { "<leader>db",       desc = "Toggle Breakpoint" },
            { "<leader>dc",       desc = "Continue" },
            { "<leader>dd",       desc = "Step Out" },
            { "<leader>di",       desc = "Step Into" },
            { "<leader>do",       desc = "Step Over" },
            { "<leader>dq",       desc = "Terminate" },
            { "<leader>du",       desc = "Toggle UI" },
            { "<leader>e",        desc = "Toggle File Explorer" },

            { "<leader>f",        group = "Find" },
            { "<leader>fb",       "<cmd>Telescope buffers<CR>",     desc = "Buffers" },
            { "<leader>ff",       "<cmd>Telescope find_files<CR>",  desc = "Files" },
            { "<leader>fg",       "<cmd>Telescope live_grep<CR>",   desc = "Grep" },
            { "<leader>fh",       "<cmd>Telescope help_tags<CR>",   desc = "Help" },

            { "<leader>r",        group = "Refactor" },
            { "<leader>rr",       desc = "Rename Symbol" },

            { "<leader>t",        group = "Terminal" },
            { "<leader>tr",       desc = "Toggle REPL" },
            { "<leader>tR",       desc = "Restart REPL" },
            { "<leader>tc",       desc = "Send motion / visual" },
            { "<leader>tf",       desc = "Send file" },
            { "<leader>tl",       desc = "Send line" },
            { "<leader>tp",       desc = "Send paragraph" },
            { "<leader>tu",       desc = "Send until cursor" },
            { "<leader>tm",       desc = "Send from mark" },
            { "<leader>tb",       desc = "Send code block" },
            { "<leader>tn",       desc = "Send code block and move" },
            { "<leader>tmc",      desc = "Mark motion / visual" },
            { "<leader>tmd",      desc = "Remove mark" },
            { "<leader>t<cr>",    desc = "Send <CR>" },
            { "<leader>t<space>", desc = "Interrupt REPL" },
            { "<leader>tq",       desc = "Exit REPL" },
            { "<leader>tcl",      desc = "Clear REPL" },

            { "<leader>n",        group = "CWD" },
            { "<leader>nn",       desc = "Open nvim config" },
            { "<leader>nc",       desc = "Open .config" },
            { "<leader>no",       desc = "Open Vault" },
            { "<leader>o",        desc = "Obsidian commands" },
            { "<leader>of",       desc = "Follow link" },
            { "<leader>on",       desc = "Create new note" },
            { "<leader>ob",       desc = "Show backlinks" },

            { "<leader>g",        desc = "Open git terminal" },
            { "<leader>" },
        })
    end,
}
