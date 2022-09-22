local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
require("telescope").load_extension "file_browser"

telescope.setup {
  defaults = {
 file_ignore_patterns = {"node_modules"}
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
    }
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      previewer = false,
    }
  }
}

vim.api.nvim_set_keymap('n', '<C-P>', "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true })
-- vim.api.nvim_set_keymap('n', '<C-N>', ":Telescope file_browser<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-F>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', ":Telescope buffers<CR>", { noremap = true })
