return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()

        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        local opts = {}

        opts.desc = "Harpoon add file"
        vim.keymap.set("n", "<leader>a", mark.add_file)

        opts.desc = "Harpoon show menu"
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        opts.desc = "Harpoon jump 1"
        vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end, opts)
        opts.desc = "Harpoon jump 2"
        vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end, opts)
        opts.desc = "Harpoon jump 3"
        vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end, opts)
        opts.desc = "Harpoon jump 4"
        vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end, opts)
        opts.desc = "Harpoon jump 5"
        vim.keymap.set("n", "<C-5>", function() ui.nav_file(5) end, opts)
        opts.desc = "Harpoon jump 6"
        vim.keymap.set("n", "<C-6>", function() ui.nav_file(6) end, opts)
        opts.desc = "Harpoon jump 7"
        vim.keymap.set("n", "<C-7>", function() ui.nav_file(7) end, opts)
        opts.desc = "Harpoon jump 8"
        vim.keymap.set("n", "<C-8>", function() ui.nav_file(8) end, opts)
        opts.desc = "Harpoon jump 9"
        vim.keymap.set("n", "<C-9>", function() ui.nav_file(9) end, opts)
        opts.desc = "Harpoon jump 0"
        vim.keymap.set("n", "<C-0>", function() ui.nav_file(0) end, opts)

    end,
}
