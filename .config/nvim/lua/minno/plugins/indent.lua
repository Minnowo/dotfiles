return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function ()

        local ibl = require("ibl")

        ibl.setup()

        return
        ibl.setup({
            indent = {
                char = "▎",
                tab_char = nil,
                highlight = "IblIndent",
                smart_indent_cap = false,
                priority = 1,
            },
            scope = {
                show_start = false,
                show_end = false
            }
        })
    end

}
