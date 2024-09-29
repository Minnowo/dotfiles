return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local themes = require('telescope.themes')
        local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        width = 0.99,
                        height = 0.99,
                        preview_width = 0.4,
                    },
                },
                vimgrep_arguments = {
                    'rg',
                    '--color=never',
                    '--no-heading',
                    '--with-filename',
                    '--line-number',
                    '--column',
                    '--smart-case',
                    '--hidden',
                },
                path_display = { "truncate " },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                    },
                },
            },
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap

        keymap.set("n", "<leader>?", "<cmd>Telescope keymaps<cr>", { desc = "Search all keybinds" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd (live grep)" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
        keymap.set('n', '<leader>o', builtin.oldfiles, { desc = "Search old files" })

        keymap.set("n", "<leader>ff", function() builtin.find_files({ hidden = true }) end,
            { desc = "Fuzzy find files in cwd" })

        keymap.set('n', '<leader>b', function() builtin.buffers({ sort_mru = true, ignore_current_buffer = true }) end,
            { desc = "Search for buffer" })

        keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(themes.get_dropdown {
                winblend = 0,
                previewer = true,
                layout_config = {
                    width=0.80,
                    height=0.99,
                }
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

    end,
}
