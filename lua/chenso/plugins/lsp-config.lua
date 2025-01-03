return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
 dependencies = { "williamboman/mason.nvim" }, -- Declare dependency
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()

      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.ruby_lsp.setup({
        capabilities = capabilities
      })

			lspconfig.lua_ls.setup({
        capabilities = capabilities
      })

			lspconfig.ts_ls.setup({
        capabilities = capabilities
      })
		end,
	},
}
