return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer"      , -- source for text in buffer
        "hrsh7th/cmp-path"        , -- source for file system paths
        "L3MON4D3/LuaSnip"        , -- snippet engine
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
    },

    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({

            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },

            -- configure how nvim-cmp interacts with snippet engine
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-p>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-n>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scrolls doc preview
                ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- scrolls doc preview
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-c>"] = function ()

                    -- close completion window
                    cmp.mapping.abort()

                    -- force enter normal mode
                    vim.cmd('stopinsert')

                end,
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),

            -- sources for autocompletion
            sources = cmp.config.sources({
                {
                    name = "nvim_lsp"
                },
                {
                    name = "luasnip"
                },
                {
                    name = "buffer",
                    option = {
                        get_bufnrs = function()
                            local buf = vim.api.nvim_get_current_buf()
                            local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                            -- don't die on stuff larger than 5mb
                            if byte_size > 5 * 1024 * 1024 then
                                return {}
                            end
                            return { buf }
                        end
                    }
                },
                {
                    name = "path"
                },
            })
        })
    end
}
