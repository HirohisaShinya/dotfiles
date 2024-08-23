return {
  event = "VimEnter",
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")
    -- set keymaps
    vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    vim.keymap.set(
      "n",
      "<leader>ef",
      "<cmd>NvimTreeFindFileToggle<CR>",
      { desc = "Toggle file explorer on current file" }
    )                                                                                                   -- toggle file explorer on current file
    vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })   -- refresh file explorer

    -- configure nvim-tree
    nvimtree.setup({
      view = {
        width = 38,
        relativenumber = false,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = false,
        },
        highlight_git = true,
        highlight_opened_files = "name",
        icons = {
          glyphs = {
            git = {
              unstaged = "!",
              renamed = "»",
              untracked = "?",
              deleted = "✘",
              staged = "✓",
              unmerged = "",
              ignored = "◌",
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      on_attach = function (bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Dir'))
        vim.keymap.set('n', '<Enter>', api.tree.change_root_to_node, opts('CD'))
        vim.keymap.set('n', 'E', api.node.open.vertical, opts('Open Vertical'))
        vim.keymap.set('n', 'S', api.node.open.horizontal, opts('Open Horizontal'))
        vim.keymap.set('n', '<BS>', api.tree.change_root_to_parent, opts('UP'))
      end,
    })
  end,
}
