return {
  'stevearc/oil.nvim',
  opts = {},
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  --
    config = function()

        local oil = require("oil")

        oil.setup({
            -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
            -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
            default_file_explorer = true,
            -- Id is automatically added at the beginning, and name at the end
            -- See :help oil-columns
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
            -- Buffer-local options to use for oil buffers
            buf_options = {
                buflisted = false,
                bufhidden = "hide",
            },
            -- Window-local options to use for oil buffers
            win_options = {
                wrap = false,
                signcolumn = "no",
                cursorcolumn = false,
                foldcolumn = "0",
                spell = false,
                list = false,
                conceallevel = 3,
                concealcursor = "nvic",
            },
            -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
            delete_to_trash = false,
            -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
            skip_confirm_for_simple_edits = false,
            -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
            -- (:help prompt_save_on_select_new_entry)
            prompt_save_on_select_new_entry = true,
            -- Oil will automatically delete hidden buffers after this delay
            -- You can set the delay to false to disable cleanup entirely
            -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
            cleanup_delay_ms = 2000,
            lsp_file_methods = {
                -- Enable or disable LSP file operations
                enabled = false,
                -- Time to wait for LSP file operations to complete before skipping
                timeout_ms = 1000,
                -- Set to true to autosave buffers that are updated with LSP willRenameFiles
                -- Set to "unmodified" to only save unmodified buffers
                autosave_changes = false,
            },
            -- Constrain the cursor to the editable parts of the oil buffer
            -- Set to `false` to disable, or "name" to keep it on the file names
            constrain_cursor = "name",
            -- Set to true to watch the filesystem for changes and reload oil
            watch_for_changes = false,
            -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("oil.actions").<name>
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                -- ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
                -- ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
                -- ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                -- ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.refresh",
                ["<C-r>"] = "actions.refresh",
                ["<BS>"] = "actions.parent",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["="] = "actions.cd",
                ["gs"] = "actions.change_sort",
                ["g."] = "actions.toggle_hidden",
            },
            -- Set to false to disable all of the above keymaps
            use_default_keymaps = true,

            view_options = {
                show_hidden = true,
                natural_order = true,
                case_insensitive = false,
                sort = {
                    -- sort order can be "asc" or "desc"
                    -- see :help oil-columns to see which columns are sortable
                    { "type", "asc" },
                    { "name", "asc" },
                },
            },
        })
    end

}
