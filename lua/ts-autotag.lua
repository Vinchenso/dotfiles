-- local status, autotag = pcall(require, "nvim-ts-autotag")
-- if (not status) then return end

-- autotag.setup{}

-- require'nvim-treesitter.configs'.setup {
--   autotag = {
--     enable = true,
--   }
-- }

require('nvim-ts-autotag').setup()
