return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function ()

        local comment = require("Comment")
        local ft = require('Comment.ft')

        comment.setup({
            ignore = '^$',
            mappings = false,
        })

        -- reimu filetype
        ft.set('reimu', {'//%s', '/*%s*/'})
        vim.cmd([[ autocmd FileType reimu setlocal commentstring=//\ %s ]])

        vim.keymap.set('n', '<C-_>', '<Plug>(comment_toggle_linewise_current)', { desc = 'Comment toggle linewise' })
        vim.keymap.set('n', '<C-/>', '<Plug>(comment_toggle_linewise_current)', { desc = 'Comment toggle linewise' })
        vim.keymap.set('x','<C-_>', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Comment toggle linewise (visual)' })
        vim.keymap.set('x','<C-/>', '<Plug>(comment_toggle_linewise_visual)', { desc = 'Comment toggle blockwise (visual)' })
    end
}
