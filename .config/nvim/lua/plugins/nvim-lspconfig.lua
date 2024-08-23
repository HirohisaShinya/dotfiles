return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { "lukas-reineke/lsp-format.nvim" },
    { 'folke/neodev.nvim' },
  },
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lspconfig = require('lspconfig')
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local on_attach = function(client, bufnr)
      require("lsp-format").on_attach(client, bufnr)
      -- ... custom code ...
    end

    -- TypeScript
    lspconfig.tsserver.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      single_file_support = false,
      root_dir = lspconfig.util.root_pattern("package.json"),
    }

    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
      end,
    })
  end,
}
