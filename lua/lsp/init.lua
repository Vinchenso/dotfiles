local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lsp.lsp-installer")
require("lsp.handlers").setup()
require("lsp.null-ls")


local protocol = require('vim.lsp.protocol')

-- nvim_lsp['rubocop'].setup{}
