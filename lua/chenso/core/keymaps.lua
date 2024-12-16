-- set leader key to space
vim.g.mapleader = ","

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- clear search highlights
keymap.set("n", "<C-a>", ":nohl<CR>")

keymap.set("c", "WQ", "wq")
keymap.set("c", "Wq", "wq")
keymap.set("c", "Q!", "q!")
keymap.set("c", "W!", "w!")
keymap.set("c", "W", "w")
keymap.set("c", "Q", "q")
keymap.set("c", "Vs", "vs")

----------------------
-- Plugin Keybinds
----------------------

-- telescope
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader><leader>", "<cmd>Telescope oldfiles<cr>") -- list available help tags



      keymap.set("n", "K", vim.lsp.buf.hover, {})
      keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})


