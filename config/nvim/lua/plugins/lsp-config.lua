return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "tailwindcss",
          "ts_ls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      end
      
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      
      -- Lua Language Server
      vim.lsp.config.lua_ls = {
        cmd = { "lua-language-server" },
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      }
      
      -- Python
      vim.lsp.config.pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        on_attach = on_attach,
        capabilities = capabilities,
      }
      
      -- TailwindCSS
      vim.lsp.config.tailwindcss = {
        cmd = { "tailwindcss-language-server", "--stdio" },
        on_attach = on_attach,
        capabilities = capabilities,
      }
      
      -- TypeScript
      vim.lsp.config.ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        on_attach = on_attach,
        capabilities = capabilities,
      }
      
      -- Auto-start LSP servers for appropriate file types
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua" },
        callback = function()
          vim.lsp.start(vim.lsp.config.lua_ls)
        end,
      })
      
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "python" },
        callback = function()
          vim.lsp.start(vim.lsp.config.pyright)
        end,
      })
      
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "css", "html", "javascript", "typescript", "vue", "svelte" },
        callback = function()
          vim.lsp.start(vim.lsp.config.tailwindcss)
        end,
      })
      
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        callback = function()
          vim.lsp.start(vim.lsp.config.ts_ls)
        end,
      })
    end,
  },
}
