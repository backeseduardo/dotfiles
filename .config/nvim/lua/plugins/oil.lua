return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function(_, opts)
    require("oil").setup(opts)
    -- Add keymap here
    vim.keymap.set("n", "<leader>oi", function()
      require("oil").open_float(vim.fn.expand("%:p:h"))
    end, { desc = "Open Oil in floating window (current buffer path)" })
  end,
}
