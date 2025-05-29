return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { 
        "mason-org/mason.nvim",
        opts = {}
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- custom hover
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = "single" }
      )

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_keymaps = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0, desc = "Displays hover information for the symbol under the cursor in a floating window, showing documentation or details provided by the LSP."})
        vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, {buffer = 0, desc = "Goto Definition"})
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = 0, desc = "Goto Declaration"})
        vim.keymap.set("n", "gtd", require("telescope.builtin").lsp_type_definitions, {buffer = 0, desc = "Goto Type Definition"})
        -- vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer = 0, desc = "Moves the cursor to the next diagnostic (error, warning, etc.) in the current buffer, as reported by the LSP."})
        -- vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, {buffer = 0, desc = "Moves the cursor to the previous diagnostic (error, warning, etc.) in the current buffer, as reported by the LSP."})
        -- vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer = 0, desc = "Opens Telescope to display a list of all diagnostics (errors, warnings, etc.) for the current buffer, allowing interactive navigation."})
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0, desc = "Rename"})
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0, desc = "Code Action"})
        vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references, {buffer = 0, desc = "Goto References"})
        vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, {buffer = 0, desc = "Goto Implementation"})
        vim.keymap.set("n", "<leader>d", function()
          vim.diagnostic.open_float(nil, {focusable = false, scope = "line", --[[max_width = 80, --]] border = "single"})
        end, {buffer = 0, desc = "Current line diagnostics"})
      end
      require'lspconfig'.clangd.setup{
        capabilities = capabilities,
        on_attach = lsp_keymaps,
        cmd = { "clangd", "--compile-commands-dir=build" },
        root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
      }
      require'lspconfig'.gopls.setup{
        capabilities = capabilities,
        on_attach = lsp_keymaps,
      }
      require'lspconfig'.pyright.setup{
        capabilities = capabilities,
        on_attach = lsp_keymaps,
      }
      require'lspconfig'.ts_ls.setup{
        capabilities = capabilities,
        on_attach = lsp_keymaps,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" }, 
        cmd = { "typescript-language-server", "--stdio" }
      }
      -- Autoformat buffer
      vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = buffer,
          callback = function()
              vim.lsp.buf.format { async = false }
          end
      })
    end,
  }
}
