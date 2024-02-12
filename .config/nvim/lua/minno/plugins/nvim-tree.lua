return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local nvimtree = require("nvim-tree")
        local api = require("nvim-tree.api")
        local lib = require("nvim-tree.lib")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- change color for arrows in tree to light blue
        vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
        vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])

        -- configure nvim-tree
        nvimtree.setup({
            view = {
                --        width = 35,
                relativenumber = true,
            },

            -- change folder arrow icons
            renderer = {
                indent_markers = {
                    enable = true,
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },

            git = {
                ignore = false,
            },

            on_attach = function(bufnr)

                local function opts(desc)
                    return {
                        desc = 'nvim-tree: ' .. desc,
                        buffer = bufnr,
                        noremap = true,
                        silent = true,
                        nowait = true,
                    }
                end

                -- BEGIN_DEFAULT_ON_ATTACH
                vim.keymap.set('n', '<C-t>',   api.node.open.tab,                   opts('Open: New Tab'))
                vim.keymap.set('n', '<C-e>',   api.node.open.replace_tree_buffer,   opts('Open: In Place'))
                vim.keymap.set('n', '<C-i>',   api.node.show_info_popup,            opts('Show File Info'))

                vim.keymap.set('n', '<C-n>',       api.node.navigate.sibling.next,  opts('Next Sibling'))
                vim.keymap.set('n', '<C-p>',       api.node.navigate.sibling.prev,  opts('Previous Sibling'))

                vim.keymap.set('n', '<BS>',    api.node.navigate.parent_close,      opts('Close Directory'))
                vim.keymap.set('n', '<CR>',    api.node.open.edit,                  opts('Open'))
                vim.keymap.set('n', '<Tab>',   api.node.open.preview,               opts('Open Preview'))

                vim.keymap.set('n', '-',       api.tree.change_root_to_parent,      opts('Up'))
                vim.keymap.set('n', '=',       api.tree.change_root_to_node,        opts('CD'))

                vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
                vim.keymap.set('n', 'c',       api.fs.copy.node,                    opts('Copy'))
                vim.keymap.set('n', 'x',       api.fs.cut,                          opts('Cut'))
                vim.keymap.set('n', 'p',       api.fs.paste,                        opts('Paste'))
                vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
                vim.keymap.set('n', 'r',       api.fs.rename,                       opts('Rename'))
                vim.keymap.set('n', '<F2>',    api.fs.rename,                       opts('Rename'))
                vim.keymap.set('n', '<F5>',    api.tree.reload,                     opts('Refresh'))
                vim.keymap.set('n', 'e',       api.tree.expand_all,                 opts('Expand All'))
                vim.keymap.set('n', 'E',       api.tree.collapse_all,               opts('Expand All'))
                vim.keymap.set('n', 'y',       api.fs.copy.filename,                opts('Copy Name'))
                vim.keymap.set('n', 'Y',       api.fs.copy.relative_path,           opts('Copy Relative Path'))
                vim.keymap.set('n', 'gy',      api.fs.copy.absolute_path,           opts('Copy Absolute Path'))

                vim.keymap.set('n', 'f',       api.live_filter.start,               opts('Live Filter: Start'))
                vim.keymap.set('n', 'F',       api.live_filter.clear,               opts('Live Filter: Clear'))

                vim.keymap.set('n', '?',      api.tree.toggle_help,                opts('Help'))

                vim.keymap.set('n', 'B',       api.tree.toggle_no_buffer_filter,    opts('Toggle Filter: No Buffer'))
                vim.keymap.set('n', 'H',       api.tree.toggle_hidden_filter,       opts('Toggle Filter: Dotfiles'))
                vim.keymap.set('n', 'I',       api.tree.toggle_gitignore_filter,    opts('Toggle Filter: Git Ignore'))
                vim.keymap.set('n', 'J',       api.node.navigate.sibling.last,      opts('Last Sibling'))
                vim.keymap.set('n', 'K',       api.node.navigate.sibling.first,     opts('First Sibling'))
                vim.keymap.set('n', 'q',       api.tree.close,                      opts('Close'))
                vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,           opts('Open'))

                vim.keymap.set('n', '<leader>mpv',
                    function()
                        vim.cmd("!mpv " .. vim.fn.shellescape(lib.get_node_at_cursor().absolute_path))
                    end,           opts('Open the file under cursor with MPV')
                )
            end
        })

        vim.cmd [[
        :hi link NvimTreeExecFile Title 
        :hi link NvimTreeSpecialFile NvimTreeNormal 
        :hi link NvimTreeImageFile NvimTreeNormal 
        :hi link NvimTreeSymlink NvimTreeSpecialFile 
        ]]

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
        keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

        -- api.tree.toggle_help()

    end,
}
