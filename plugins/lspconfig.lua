local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver", "emmet_ls", "eslint", "jsonls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
-- lspconfig.emmet_ls.setup {
--   -- on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
-- }
-- local M = {}
--
-- M.setup_lsp = function(attach, capabilities)
--    local lspconfig = require "lspconfig"
--
--    -- lspservers with default config
--    local servers = { "html", "cssls", "tsserver", "emmet_ls", "eslint", "jsonls" }
--
--    for _, lsp in ipairs(servers) do
--       lspconfig[lsp].setup {
--          on_attach = function(client, bufnr)
--             attach(client, bufnr)
--             -- root_dir = vim.loop.cwd,
--             if lsp == "emmet_ls" then
--                capabilities.textDocument.completion.completionItem.snippetSupport = true
--             end
--          end,
--          capabilities = capabilities,
--       }
--    end
--
--    lspconfig.emmet_ls.setup {
--       -- on_attach = on_attach,
--       capabilities = capabilities,
--       filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
--    }
--
--    require("lspconfig").tsserver.setup {}
-- end
--
-- return M
