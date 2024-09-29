return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()

        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap -- for conciseness

        local opts = { noremap = true, silent = true }

        local on_attach = function(_, bufnr)

            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "[LSP] Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

            opts.desc = "[LSP] Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

            opts.desc = "[LSP] Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

            opts.desc = "[LSP] Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

            opts.desc = "[LSP] Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

            opts.desc = "[LSP] See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

            opts.desc = "[LSP] Smart rename"
            keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

            opts.desc = "[LSP] Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

            opts.desc = "[LSP] Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

            opts.desc = "[LSP] Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

            opts.desc = "[LSP] Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

            opts.desc = "[LSP] Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

            opts.desc = "[LSP] Restart LSP"
            keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local lsps = { "html", "clangd", "gopls", "templ", "jedi_language_server"}

        for _, x in pairs(lsps) do

            lspconfig[x].setup({
                capabilities = capabilities,
                on_attach = on_attach,
            })

        end

        lspconfig["jsonls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                json = {
                    schemas = {
                        {
                            fileMatch = { "package.json" },
                            url = "https://json.schemastore.org/package.json"
                        },
                        {
                            fileMatch = { "tsconfig*.json" },
                            url = "https://json.schemastore.org/tsconfig.json"
                        },
                        {
                            fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
                            url = "https://json.schemastore.org/prettierrc.json"
                        },
                        {
                            fileMatch = { ".eslintrc", ".eslintrc.json" },
                            url = "https://json.schemastore.org/eslintrc.json"
                        },
                        {
                            fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
                            url = "https://json.schemastore.org/babelrc.json"
                        },
                        {
                            fileMatch = { "lerna.json" },
                            url = "https://json.schemastore.org/lerna.json"
                        },
                        {
                            fileMatch = { "now.json", "vercel.json" },
                            url = "https://json.schemastore.org/now.json"
                        },
                        {
                            fileMatch = { "ecosystem.json" },
                            url = "https://json.schemastore.org/pm2-ecosystem.json"
                        },
                    }
                }
            }
        })

        lspconfig["cssls"].setup({
            on_attach = function(client, bufnr)
                client.server_capabilities.documentFormattingProvider = true
                client.server_capabilities.documentRangeFormattingProvider = true
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
            settings = {
                css = {
                    lint = {
                        unknownAtRules = 'ignore',
                    },
                },
                scss = {
                    lint = {
                        unknownAtRules = 'ignore',
                    },
                },
            }
        })

        lspconfig["eslint"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                codeAction = {
                    disableRuleComment = {
                        enable = true,
                        location = "separateLine"
                    },
                    showDocumentation = {
                        enable = true
                    }
                },
                codeActionOnSave = {
                    enable = false,
                    mode = "all"
                },
                format = true,
                nodePath = "",
                onIgnoredFiles = "off",
                packageManager = "npm",
                quiet = false,
                rulesCustomizations = {},
                run = "onType",
                useESLintClass = false,
                validate = "on",
                workingDirectory = {
                    mode = "location"
                }
            }
        })

        lspconfig["tailwindcss"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "html", "javascript", "typescript", "typescriptreact", "templ", "astro", "vue", "svelte", "mdx" },
            init_options = {
                userLanguages = {
                    templ = "html" ,
                    eelixir = "html-eex",
                    eruby = "erb",
                }
            },
            settings = {
                tailwindCSS = {
                    lint = {
                        cssConflict = "warning",
                        invalidApply = "error",
                        invalidConfigPath = "error",
                        invalidScreen = "error",
                        invalidTailwindDirective = "error",
                        invalidVariant = "error",
                        recommendedVariantOrder = "warning",
                    },
                    experimental = {
                        classRegex = {
                            "tw`([^`]*)",
                            'tw="([^"]*)',
                            'tw={"([^"}]*)',
                            "tw\\.\\w+`([^`]*)",
                            "tw\\(.*?\\)`([^`]*)",
                            { "clsx\\(([^)]*)\\)",       "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                            { "classnames\\(([^)]*)\\)", "'([^']*)'" },
                            { "cva\\(([^)]*)\\)",        "[\"'`]([^\"'`]*).*?[\"'`]" },
                            { "cn\\(([^)]*)\\)",         "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                        },
                    },
                    validate = true,
                }
            },
        })

        lspconfig["ts_ls"].setup {
            on_attach = on_attach,
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
            cmd = { "typescript-language-server", "--stdio" }
        }

        lspconfig["gopls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                gopls = {
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    }
                }
            }
        })

        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = { -- custom settings for lua
                Lua = {
                    -- make the language server recognize "vim" global
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        -- make language server aware of runtime files
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        },
                    },
                },
            },
        })
    end,
}
