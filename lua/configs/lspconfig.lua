-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local typescript_tools = require "typescript-tools"

-- EXAMPLE
local servers = { "html", "cssls", "tailwindcss", "typescript-tools", "marksman" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- workaround: svelte LSP did not get notified on .ts file changes
-- see https://github.com/neovim/nvim-lspconfig/issues/725#issuecomment-1539822348
lspconfig.svelte.setup {
  on_attach = function(client)
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = { "*.js", "*.ts" },
      callback = function(ctx)
        client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
      end,
    })
  end,
  on_onit = nvlsp.on_init,
  capabilities = nvlsp.capabilities
}

-- typescript_tools.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.on_init,
--
--
-- }
--
-- lspconfig.rust_analyzer.setup({
--   on_attach = nvlsp.on_attach,
--   capabilities = nvlsp.capabilities,
--   filetypes = { "rust" },
--   root_dir = util.root_pattern("Cargo.toml"),
--   settings = {
--     ['rust-analyzer'] = {
--       cargo = {
--         allFeatures = true
--       }
--     }
--   }
-- })

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
