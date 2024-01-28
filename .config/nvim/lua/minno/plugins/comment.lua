return {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    opts = {
        ignore = '^$',
        toggler = {
            -- line = '<C-_>', -- works in alacritty
            line = '<C-/>'  -- works in kitty 
        } ,
        opleader = {
            -- line = '<C-_>',
            line = '<C-/>'
        }
    }
}
