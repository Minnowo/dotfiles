

local opts = {}

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


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
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "t", "F")

-- drag selected stuff lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Use ctrl-[hjkl] to move between splits
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", { silent = true })

-- replace all of current word
opts.desc = "Replace all of current word"
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)


opts.desc = "Run selected lua code"
vim.keymap.set("v", "<C-x>", [[<esc>:'<,'>:w !lua<CR>]], opts)

-- run selected lua code and open the output in a new buffer
opts.desc = "Run selected lua code and open output in new buffer"
vim.keymap.set("v", "<C-S-x>", [[<esc>:'<,'>w !lua >/tmp/out.txt<CR> :vsp /tmp/out.txt<CR>]], opts)


function Format()
    vim.lsp.buf.format()
end

