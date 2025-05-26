return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp"  -- DODANE jako wymagana zależność
    },
    config = function()
      -- Inicjalizacja capabilities PRZED użyciem
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Konfiguracja serwerów LSP
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }
          }
        }
      })

      -- Dodaj inne serwery według potrzeb
      require("lspconfig").tsserver.setup({ capabilities = capabilities })
      require("lspconfig").pyright.setup({ capabilities = capabilities })

      -- Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf

          local opts = { buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        end
      })
    end
  }
}
