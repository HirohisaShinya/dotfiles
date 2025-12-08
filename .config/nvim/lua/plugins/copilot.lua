return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = 'Copilot',
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = 'node',
    })
  end,
  filetypes = {
    markdown = true,
    help = true,
    javascript = true, -- allow specific filetype
    typescript = true, -- allow specific filetype
    ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
  },
}
