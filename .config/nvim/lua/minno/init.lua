require("minno.remap")
require("minno.set")
if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
  require("minno.lazy")
end

