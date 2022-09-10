local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok2, mason2 = pcall(require, "mason-lspconfig")
if not status_ok2 then
  return
end

require   ("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "tailwindcss" },
})
