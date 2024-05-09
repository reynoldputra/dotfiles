-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
--
-- require("lspconfig").terraformls.setup({
--   cmd = { "terraform-ls", "serve" },
-- })
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*.tf", "*.tfvars" },
--   callback = function()
--     vim.lsp.buf.format()
--   end,
-- })

-- require("lspconfig").terraform_lsp.setup({
--   cmd = { "terraform-lsp", "serve" },
-- })

-- require("lspconfig").tflint.setup({})
