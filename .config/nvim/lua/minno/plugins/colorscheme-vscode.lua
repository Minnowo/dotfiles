return {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    config = function()

        require("vscode").setup({

            color_overrides = {
                -- vscLineNumber = '#FFFFFF',
            },
        })

        vim.cmd([[colorscheme vscode]])
    end
}

