return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
          {
            "mason-org/mason.nvim",
            opts = {
              ui = {
                icons = {
                  package_installed = "✓",
                  package_pending = "➜",
                  package_uninstalled = "✗"
                }
              }
            }
          },
          "neovim/nvim-lspconfig",
        },
      }
    },
    config = function()
      -- custom hover
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = "single" }
      )

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lsp_keymaps = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
        vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
        vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, { buffer = 0 })
        vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { buffer = 0 })
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
        vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { buffer = 0 })
        vim.keymap.set("n", "<leader>e", function()
          vim.diagnostic.open_float(nil, { focusable = false, scope = "line", max_width = 80, border = "single" })
        end, { buffer = 0 })
      end

      vim.lsp.config('clangd', {
        capabilities = capabilities,
        on_attach = lsp_keymaps,
        cmd = { "clangd", "--compile-commands-dir=build" },
        root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
      })
      vim.lsp.config('gopls', {
        capabilities = capabilities,
        on_attach    = lsp_keymaps,
      })
      vim.lsp.config('pyright', {
        capabilities = capabilities,
        on_attach    = lsp_keymaps,
      })
      vim.lsp.config('denols', {
        on_attach    = lsp_keymaps,
        root_markers = { "deno.json", "deno.jsonc" },
      })
      vim.lsp.config('ts_ls', {
        on_attach           = lsp_keymaps,
        root_markers        = { "package.json" },
        single_file_support = false,
      })
      vim.lsp.config('lua_ls', {
        on_attach = lsp_keymaps,
      })

      -- Autoformat buffer
      --vim.api.nvim_create_autocmd("BufWritePre", {
      -- buffer = buffer,
      --callback = function()
      --vim.lsp.buf.format { async = false }
      --end
      --})

      -- Example function to organize imports using LSP
      local function organize_imports_lsp()
        local params = {
          command = "_typescript.organizeImports", -- Command name for tsserver
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end

      -- Example of calling organize_imports_lsp on BufWritePre
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.ts", "*.tsx" },
        callback = function()
          organize_imports_lsp()
        end,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      conform.setup({
        default_format_opts = {
          async = false,           -- not recommended to change
          quiet = false,           -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },
        format_on_save = {
          timeout_ms = 500,
        },
        formatters_by_ft = {
          -- Conform will run the first available formatter
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          javascriptreact = { "prettierd", "prettier", stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", stop_after_first = true },
          json = { "prettierd", "prettier", stop_after_first = true },
          css = { "prettierd", "prettier", stop_after_first = true },
          html = { "prettierd", "prettier", stop_after_first = true },
          markdown = { "prettierd", "prettier", stop_after_first = true },
        },
      })
    end
  }
}
