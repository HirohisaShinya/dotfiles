return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim' ,
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup( {
      defaults = {
        mappings = {
          i = {
            ['<C-h>'] = 'which_key',
          },
        },
        winblend = 20,
        file_ignore_patterns = {
            -- 検索から除外するものを指定
            "^.git/",
            "^.cache/",
            "^Library/",
            "Parallels",
            "^Movies",
            "^Music",
        },
        vimgrep_arguments = {
            -- ripggrepコマンドのオプション
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "-uu",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")
    telescope.load_extension('notify')

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set("n", "<leader>fs", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
    vim.keymap.set('n', '<leader>fn', function()
      telescope.extensions.notify.notify()
    end)
  end,
}
