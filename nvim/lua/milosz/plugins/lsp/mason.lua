return {
  {
    "williamboman/mason.nvim",
    lazy = false, -- Must load immediately
    config = true -- Default settings are fine
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig" -- MUST be included here
    },
    opts = {
      ensure_installed = { "lua_ls", "ts_ls", "pyright" }, -- Your preferred servers
      automatic_installation = true
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre", -- Load when needed
    config = function()
      -- Setup LSP capabilities for autocompletion
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Attach keymaps and setup servers
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf

          -- Keymaps
          local opts = { buffer = bufnr }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        end
      })
    
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
      vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
          severity_sort = true
      })

      -- Configure individual servers
      require('lspconfig').lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } }
          }
        }
      })

      -- Add other servers as needed
      require('lspconfig').ts_ls.setup({ capabilities = capabilities })
      require('lspconfig').pyright.setup({ capabilities = capabilities })
    end
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = "mason.nvim",
    opts = {
      ensure_installed = { "stylua", "prettier", "black" }
    }
  }
}
