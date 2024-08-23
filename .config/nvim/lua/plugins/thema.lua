return {
  {
    'catppuccin/nvim',
    event = "VimEnter",
    priority = 1000,
    name = "catppuccin",
    cond = function()
      return not vim.g.vscode
    end,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        color_overrides = {
          mocha = {
            base = "#12121a",
            mantle = "#12121a",
            crust = "#12121a",
          },
        },
        transparent_background = true,
      })
      vim.cmd.colorscheme("catppuccin-mocha")
      vim.cmd("highlight TelescopeSelection cterm=bold gui=bold guifg=#a6e3a1 guibg=#181825")
    end,
  },
}
