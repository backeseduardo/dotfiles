return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    transparent_background = false,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
  },
}
