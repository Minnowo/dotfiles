return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        --    "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")


        --   local mason_tool_installer = require("mason-tool-installer")

        -- enable mason
        mason.setup()

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "html",
                "cssls",
                "clangd",
                "gopls",
                "lua_ls",
                "templ" , -- Go template language

                -- not an lsp but we can install with mason
                --        "clang-format",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })

        --     mason_tool_installer.setup({
        --       ensure_installed = {
        --         "prettier", -- prettier formatter
        --         "stylua", -- lua formatter
        --         "isort", -- python formatter
        --         "black", -- python formatter
        --         "pylint", -- python linter
        --         "eslint_d", -- js linter
        --       },
        --     })
    end,
}
