return {
  'nvimts/frontier.nvim',
  config = function()
    require('frontier').setup({
      keys = {
        main = '<leader>z',
        add_current_file = '<leader>\\',
      },
    })
  end
}
