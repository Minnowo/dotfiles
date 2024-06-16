return {
  "brenton-leighton/multiple-cursors.nvim",
  opts = {
      custom_key_maps = {
          {"n", "<Leader>|", function() require("multiple-cursors").align() end},
      },
  },  -- This causes the plugin setup function to be called
  keys = {
    {"<C-A-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
    {"<C-A-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},

 --   {"<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move up"},
 --   {"<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i", "x"}, desc = "Add cursor and move down"},

--    {"<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}, desc = "Add or remove cursor"},

--    {"<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
    {"<Leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},

    {"<Leader>n", "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Add cursor and jump to next cword"},
    {"<Leader>N", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = {"n", "x"}, desc = "Jump to next cword"},
    {"<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},
  },
}
