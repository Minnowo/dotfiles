return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()

        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting

            highlight = {
                enable = true,
            },

            indent = { 
                enable = true 
            },

            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "yaml",
                "toml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "go",
                "templ",
                "rust",
                "c",
                "kotlin",
                "java",
                "python",
            },

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,

        })

        vim.filetype.add({
            extension = {
                templ = "templ",
            },
        })


        local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

        parser_config.reimu = {
            install_info = {
                -- local path or git repo
                url = "/home/minno/Sync/General/Compilers/Assignments/final/reimu/tree_sitter",
                -- note that some parsers also require src/scanner.c or src/scanner.cc
                files = {"src/parser.c"},
                --
                -- optional entries:
                --
                -- default branch in case of git repo if different from master
                branch = "main",
                -- if stand-alone parser without npm dependencies
                generate_requires_npm = false,
                -- if folder contains pre-generated src/parser.c
                requires_generate_from_grammar = false,
            },

            -- if filetype does not match the parser name
            filetype = "rei",
        }

        -- you can register the file type with neovim here
        vim.filetype.add({
            extension = {
                rei = "reimu",
            },
        })
    end,
}
