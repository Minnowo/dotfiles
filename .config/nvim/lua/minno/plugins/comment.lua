return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function ()

        require('Comment').setup({
            ignore = '^$',
            toggler = {
                line = '<C-_>', -- works in alacritty
                -- line = '<C-/>'  -- works in kitty 
            } ,
            opleader = {
                line = '<C-_>',
                -- line = '<C-/>'
            }
        })

        local ft = require('Comment.ft')

        -- reimu filetype
        ft.set('reimu', {'//%s', '/*%s*/'})
        vim.cmd([[ autocmd FileType reimu setlocal commentstring=//\ %s ]])


    end
}
