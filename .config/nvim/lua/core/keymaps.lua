-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- for US keyboard
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', ':', ';')


vim.keymap.set('', 'j', 'gj')
vim.keymap.set('', 'k', 'gk')
vim.keymap.set('', '<C-j>', '<C-d>')
vim.keymap.set('', '<C-k>', '<C-u>')
vim.keymap.set('n', '<C-l>', '$')
vim.keymap.set('v', '<C-l>', '$h')
vim.keymap.set('', '<C-h>', '^')

vim.keymap.set('', '<C-Space>', '<esc>')
vim.keymap.set('i', '<C-Space>', '<esc>:set iminsert=0<CR>')
vim.keymap.set('i', '<esc>', '<esc>:set iminsert=0<CR>')


vim.keymap.set('', '<s-f>', ':%s///gc<left><left><left><left>')
vim.keymap.set('v', '//', 'y/<C-R>=escape(@", \'\\/.*$^~[]\')<CR><CR>')
vim.keymap.set('v', '/r', '"xy:%s/<C-R>=escape(@x, \'\\/.*$^~[]\')<CR>//gc<Left><Left><Left>')
vim.keymap.set('v', '/gr', '"xy:%s/<C-R>=escape(@x, \'\\/.*$^~[]\')<CR>/<C-R>=escape(@x, \'\\/.*$^~[]\')<CR>/gc<Left><Left><Left>')

vim.keymap.set('n', '""', 'vi"')
vim.keymap.set('n', "''", "vi'")
vim.keymap.set('n', '((', 'vi(')
vim.keymap.set('n', '[[', 'vi[')
vim.keymap.set('n', '{{', 'vi{')

vim.keymap.set('n', 'yp', ':let @* = expand(\'%:p\')<CR>')
vim.keymap.set('n', 'yh', ':let @* = expand(\'%:h\')<CR>')
vim.keymap.set('n', 'yt', ':let @* = expand(\'%:t\')<CR>')

vim.keymap.set('n', 'Q',  '<cmd>lua vim.diagnostic.open_float()<CR>')


local github_integration = require("utils/github_integration")

-- GitHub 連携用のカスタムコマンドを設定
vim.api.nvim_create_user_command(
  "AvanteGeneratePRSummary",
  github_integration.generate_pr_summary,
  {
    desc = "Generate Pull Request summary using Claude based on staged changes.",
  }
)

vim.api.nvim_create_user_command(
  "AvanteGenerateCommitMessage",
  github_integration.generate_commit_message,
  {
    desc = "Generate Git commit message using Claude based on staged changes.",
  }
)

-- 例: Issue テンプレートをファイルから読み込み、Claudeで埋めるコマンド
vim.api.nvim_create_user_command(
  "AvanteFillIssueTemplate",
  function(opts)
    local template_path = opts.fargs[1]
    if not template_path then
      vim.notify("Usage: :AvanteFillIssueTemplate <path_to_template>", vim.log.levels.ERROR)
      return
    end

    local template_content = vim.fn.readfile(template_path)
    if vim.tbl_isempty(template_content) then
      vim.notify("Issue template file not found or empty: " .. template_path, vim.log.levels.ERROR)
      return
    end
    template_content = table.concat(template_content, "\n")

    -- 現在のバッファの内容をコンテキストとして渡す
    local current_buffer_content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")

    github_integration.fill_issue_template(template_content, current_buffer_content)
  end,
  {
    nargs = 1,
    complete = "file",
    desc = "Fill a GitHub Issue template using Claude based on current buffer content.",
  }
)


-- キーマップの例
vim.keymap.set("n", "<leader>gpr", "<cmd>AvanteGeneratePRSummary<CR>", { desc = "Generate PR Summary (Claude)" })
vim.keymap.set("n", "<leader>gcm", "<cmd>AvanteGenerateCommitMessage<CR>", { desc = "Generate Commit Message (Claude)" })
-- 必要に応じて、その他の avante.nvim のデフォルトキーマップも確認し、`avante.opts.behaviour.auto_set_keymaps = false` にして自分で設定し直すことも検討してください。
