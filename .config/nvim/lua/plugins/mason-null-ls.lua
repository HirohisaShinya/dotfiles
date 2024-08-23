return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function()
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format {
        timeout_ms = 200,
        async = true,
      }
    end)
  end,
  opt = {
    handlers = {
      prettier = function()
        require("null-ls").register(
          require("null-ls").builtins.formatting.prettier.with({
            condition = function(utils)
              return utils.root_has_file("package.json")
                or utils.root_has_file(".prettierrc")
                or utils.root_has_file(".prettierrc.json")
                or utils.root_has_file(".prettierrc.js")
            end,
          })
        )
      end,
      eslint_d = function()
        require("null-ls").register(
          require("null-ls").builtins.diagnostics.eslint_d.with({
            condition = function(utils)
              return utils.root_has_file("package.json")
                or utils.root_has_file(".eslintrc.json")
                or utils.root_has_file(".eslintrc.js")
            end,
          })
        )
      end,

    }
  },
}
