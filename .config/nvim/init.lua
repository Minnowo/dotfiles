
require ("minno")

if vim.g.vscode then

  -- VSCode extension

else
  -- ordinary Neovim

  vim.cmd.colorscheme 'rose-pine'

  require("ibl").setup({ 
    indent = {
        char = "▎",
        tab_char = nil,
        highlight = "IblIndent",
        smart_indent_cap = false,
        priority = 1,
    },
    scope = {
      show_start = false,
      show_end = false
    }
  })


end
