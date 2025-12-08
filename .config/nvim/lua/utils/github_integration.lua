local github_integration = {}
local avante = require("avante")

--- GitHub CLI コマンドを非同期で実行するヘルパー関数
--- @param args table: gh コマンドの引数 (例: {"pr", "create", ...})
--- @param input string|nil: stdin に渡す文字列 (例: PR Body)
--- @return table: {stdout: string, stderr: string, code: number}
local function run_gh_command(args, input)
  local cmd = { "gh" }
  vim.list_extend(cmd, args)

  return vim.fn.systemlist(table.concat(cmd, " "), input)
end

--- Git diff を取得するヘルパー関数
--- @param staged boolean: trueならステージングされた差分, falseなら全て
--- @return string
local function get_git_diff(staged)
  local diff_cmd = { "git", "diff" }
  if staged then
    table.insert(diff_cmd, "--staged")
  end
  local diff_output = vim.fn.system(table.concat(diff_cmd, " "))
  return diff_output
end

--- Git コミットメッセージを取得するヘルパー関数
--- @param limit number: 取得するコミットメッセージの数
--- @return string
local function get_commit_messages(limit)
  local log_cmd = { "git", "log", "--pretty=format:%s%n%b", "-n", tostring(limit) }
  local log_output = vim.fn.system(table.concat(log_cmd, " "))
  return log_output
end

--- PR の概要をClaudeに生成させる関数
function github_integration.generate_pr_summary()
  local diff = get_git_diff(true) -- ステージングされた差分を取得
  local commits = get_commit_messages(5) -- 直近5件のコミットメッセージを取得

  if vim.tbl_isempty(diff) then
    vim.notify("No staged changes found to generate PR summary.", vim.log.levels.WARN)
    return
  end

  local prompt_data = avante.prompts.pr_summary:format(diff, commits)

  vim.notify("Generating PR summary with Claude...", vim.log.levels.INFO)

  -- avante.nvim の chat 関数を使ってAIと対話
  avante.run_mode("chat", {
    input = prompt_data,
    provider = 'bedrock',
    model = 'us.anthropic.claude-3-7-sonnet-20250219-v1:0',
    on_output = function(result)
      if result and result.output then
        vim.notify("PR Summary generated!", vim.log.levels.INFO)
        -- 結果を新しいバッファで表示
        vim.cmd("vsplit")
        vim.cmd("setlocal buftype=nofile nobuflisted bufhidden=wipe")
        vim.fn.setline(1, vim.split(result.output, "\n"))
        vim.api.nvim_buf_set_name(0, "[PR Summary by Claude]")
      else
        vim.notify("Failed to generate PR summary: " .. (result and result.error_message or "Unknown error"), vim.log.levels.ERROR)
      end
    end,
  })
end

--- コミットメッセージをClaudeに生成させる関数
function github_integration.generate_commit_message()
  local diff = get_git_diff(true) -- ステージングされた差分を取得
  if vim.tbl_isempty(diff) then
    vim.notify("No staged changes found to generate commit message.", vim.log.levels.WARN)
    return
  end

  -- ユーザーに任意の指示を入力させる（dressing.nvim が有効な場合）
  vim.ui.input({
    prompt = "Instructions for commit message (e.g., 'feat', 'fix', 'refactor'):",
    default = "feat", -- デフォルト値
  }, function(input_instruction)
    local instruction = input_instruction or ""
    local prompt_data = avante.prompts.commit_message_gen:format(diff, instruction)

    vim.notify("Generating commit message with Claude...", vim.log.levels.INFO)

    avante.run_mode("chat", {
      input = prompt_data,
      provider = 'bedrock',
      model = 'us.anthropic.claude-3-7-sonnet-20250219-v1:0',
      on_output = function(result)
        if result and result.output then
          vim.notify("Commit message generated!", vim.log.levels.INFO)
          -- 結果を新しいバッファで表示し、コピーを促す
          vim.cmd("split")
          vim.cmd("setlocal buftype=nofile nobuflisted bufhidden=wipe")
          vim.fn.setline(1, vim.split(result.output, "\n"))
          vim.api.nvim_buf_set_name(0, "[Commit Message by Claude]")
          vim.notify("Press 'y' to yank the message to clipboard.", vim.log.levels.INFO)
          vim.api.nvim_buf_set_keymap(0, 'n', 'y', '"+yy', { noremap = true, silent = true, desc = 'Yank to clipboard' })
        else
          vim.notify("Failed to generate commit message: " .. (result and result.error_message or "Unknown error"), vim.log.levels.ERROR)
        end
      end,
    })
  end)
end


--- Issue テンプレートの記入を Claude に依頼する関数
--- @param template_content string: GitHub Issue テンプレートの内容
--- @param context_content string: エラーログやユーザーの説明などのコンテキスト
function github_integration.fill_issue_template(template_content, context_content)
  local prompt_data = avante.prompts.issue_template_fill:format(context_content, template_content)

  vim.notify("Filling issue template with Claude...", vim.log.levels.INFO)

  avante.run_mode("chat", {
    input = prompt_data,
    provider = 'bedrock',
    model = 'us.anthropic.claude-3-7-sonnet-20250219-v1:0',
    on_output = function(result)
      if result and result.output then
        vim.notify("Issue template filled!", vim.log.levels.INFO)
        vim.cmd("vsplit")
        vim.cmd("setlocal buftype=nofile nobuflisted bufhidden=wipe")
        vim.fn.setline(1, vim.split(result.output, "\n"))
        vim.api.nvim_buf_set_name(0, "[Filled Issue by Claude]")
      else
        vim.notify("Failed to fill issue template: " .. (result and result.error_message or "Unknown error"), vim.log.levels.ERROR)
      end
    end,
  })
end

return github_integration
