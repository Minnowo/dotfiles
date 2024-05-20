return {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = function()
        local dressing = require("dressing")

        dressing.setup({
            input = {
                -- Set to false to disable the vim.ui.input implementation
                enabled = true,

                -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                prefer_width = 0.99,
                width = 0.99,

                -- Set to `false` to disable
                mappings = {
                    n = {
                        ["<Esc>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },
                    i = {
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                        ["<Up>"] = "HistoryPrev",
                        ["<Down>"] = "HistoryNext",
                    },
                },
            },
            select = {
                -- Set to false to disable the vim.ui.select implementation
                enabled = true,

                -- Priority list of preferred vim.select implementations
                backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

                -- Trim trailing `:` from prompt
                trim_prompt = true,

                -- Options for fzf selector
                fzf = {
                    window = {
                        width = 0.5,
                        height = 0.5,
                    },
                },

                -- Options for fzf-lua
                fzf_lua = {
                    winopts = {
                      height = 0.5,
                      width = 0.5,
                    },
                },

                -- Options for built-in selector
                builtin = {
                    -- Display numbers for options and set up keymaps
                    show_numbers = true,
                    -- These are passed to nvim_open_win
                    border = "rounded",
                    -- 'editor' and 'win' will default to being centered
                    relative = "editor",

                    buf_options = {},
                    win_options = {
                        cursorline = true,
                        cursorlineopt = "both",
                    },

                    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- the min_ and max_ options can be a list of mixed types.
                    -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
                    width = nil,
                    max_width = { 140, 0.8 },
                    min_width = { 40, 0.2 },
                    height = nil,
                    max_height = 0.9,
                    min_height = { 10, 0.2 },

                    -- Set to `false` to disable
                    mappings = {
                        ["<Esc>"] = "Close",
                        ["<C-c>"] = "Close",
                        ["<CR>"] = "Confirm",
                    },
                },
            },
        }
        )
    end
}
