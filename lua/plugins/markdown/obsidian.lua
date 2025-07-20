return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended: latest release
    lazy = true,
    event = {
        "BufReadPre " .. vim.fn.expand("~") .. "/Documents/ObVault/*.md",
        "BufNewFile " .. vim.fn.expand("~") .. "/Documents/ObVault/*.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "vault",
                path = "~/Documents/ObVault",
            },
        },

        completion = {
            nvim_cmp = true,
        },

        -- This will save new notes to the "Fleeting Notes" subdir of the vault
        notes_subdir = "Fleeting Notes",
        new_notes_location = "notes_subdir",

        note_id_func = function(title)
            local suffix = ""
            if title ~= nil then
                suffix = title:gsub(" ", "-"):lower()
            else
                suffix = tostring(os.time())
            end
            return suffix
        end,

        note_frontmatter_func = function(note)
            -- Auto-tag the note with the parent directory name
            local parent = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t")
            return {
                tags = { parent },
                aliases = { note.title },
            }
        end,

        follow_url_func = function(url)
            vim.fn.jobstart({ "xdg-open", url }, { detach = true })
        end,
    },
    keys = {
        { "<leader>on", "<cmd>ObsidianNew<CR>",        desc = "New Note" },
        { "<leader>of", "<cmd>ObsidianFollowLink<CR>", desc = "Follow Link" },
        { "<leader>ob", "<cmd>ObsidianBacklinks<CR>",  desc = "Show Backlinks" },
    },
    config = function()
        require("obsidian").setup({
            ui = { enable = false },
        })
    end,
}
