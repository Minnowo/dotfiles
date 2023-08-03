


vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- for ctrl+backspace to delete word
vim.keymap.set("i", "<C-h>", "<C-w>") -- works in alacritty
vim.keymap.set("i", "<C-BS>", "<C-w>") -- works in kitty

-- for ctrl+del to delete word
vim.keymap.set("i", "<C-Del>", "<C-o>dw")
vim.keymap.set("v", "<tab>", "<C-o>dw")

-- makes tab and shift-tab add / remove indentation
vim.keymap.set('v', '<Tab>', '>gv')
vim.keymap.set('v', '<S-Tab>', '<gv')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "Q", "<nop>")
