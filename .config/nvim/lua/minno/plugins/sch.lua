return {
    "Minnowo/sch.nvim",
    config = function()

        local sch = require("simple_color_highlight")

        vim.api.nvim_create_user_command("HighlightHexClear", function() sch.highlight_clear(0)    end, { })
        vim.api.nvim_create_user_command("HighlightHexAll"  , function() sch.highlight_all(0)      end, { })
        vim.api.nvim_create_user_command("HighlightHexView" , function() sch.highlight_view(0, 25) end, { })

    end,
}
